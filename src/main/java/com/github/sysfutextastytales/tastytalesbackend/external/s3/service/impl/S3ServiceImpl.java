package com.github.sysfutextastytales.tastytalesbackend.external.s3.service.impl;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.S3Object;
import com.github.sysfutextastytales.tastytalesbackend.external.s3.service.S3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@RequiredArgsConstructor
public class S3ServiceImpl implements S3Service {
    private final AmazonS3 s3;

    @Value("${s3.bucket.name}")
    private String bucketName;

    @Override
    public PutObjectResult upload(String keyName, MultipartFile file) throws IOException {
        return s3.putObject(bucketName, keyName, file.getInputStream(), null);
    }

    @Override
    public S3Object get(String keyName) {
        return s3.getObject(bucketName, keyName);
    }
}
