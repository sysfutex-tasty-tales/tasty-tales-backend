package com.github.sysfutextastytales.tastytalesbackend.external.s3.controller;

import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.github.sysfutextastytales.tastytalesbackend.external.s3.service.S3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Objects;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/media/img")
public class S3ImageController {
    private final S3Service service;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping(consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public void upload(
            @RequestParam(value = "dir", required = false) String directoryName,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        String keyName = directoryName != null
                ? directoryName + "/" + file.getOriginalFilename()
                : file.getOriginalFilename();

        service.upload(keyName, file);
    }

    @GetMapping
    public ResponseEntity<InputStreamResource> get(@RequestParam("file") String fileName) {
        S3ObjectInputStream content = null;
        try {
            content = service.get(fileName).getObjectContent();
        } catch (AmazonS3Exception exception) {
            if (exception.getStatusCode() == HttpStatus.NOT_FOUND.value()) {
                return ResponseEntity.notFound().build();
            }
        }

        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_PNG)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + "\"")
                .body(new InputStreamResource(Objects.requireNonNull(content)));
    }
}
