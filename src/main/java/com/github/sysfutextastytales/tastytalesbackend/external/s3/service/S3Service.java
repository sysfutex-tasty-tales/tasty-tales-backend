package com.github.sysfutextastytales.tastytalesbackend.external.s3.service;

import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.S3Object;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface S3Service {
    PutObjectResult upload(String keyName, MultipartFile file) throws IOException;

    S3Object get(String keyName);
}
