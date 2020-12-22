/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.Part;

/**
 *
 * @author delli
 */
public class FileUtils {
    public static String RUTE_USER_IMAGE = "C:/assets/images";
    public static String RUTE_USER_VIDEO = "C:/assets/videos";
    
    public static String GetExtension(String contentType) {
        switch (contentType) {
            case "image/png":
                return ".png";
            case "image/jpeg":
                return ".jpg";
            case "video/mp4":
                return ".mp4";
        }
        return ".ext";
    }
    
    public static String GetFileType(String contentType){
        int index = contentType.indexOf('/');
        return contentType.substring(0, index);
    }
    
    public static MultimediaFile UploadImage(Part image) throws IOException{
        String imagePath = "";
        String nameImage = "";
        String fileExt = "";
        
        File fileSaveDir = new File(utility.FileUtils.RUTE_USER_IMAGE);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        
        if(image != null){
            String contentType = image.getContentType();
            fileExt = utility.FileUtils.GetExtension(contentType);
            nameImage = image.getName() + System.currentTimeMillis() + fileExt;
            File imageFile = new File(fileSaveDir, nameImage);
            imagePath = imageFile.toPath().toString();
            image.write(imagePath);
        }
        
        return new MultimediaFile(imagePath, nameImage, fileExt, 'i');
    }
    
    public static MultimediaFile UploadVideo(Part video) throws IOException{
        String videoPath = "";
        String nameVideo = "";
        String fileExt = "";
        
        File fileSaveDir = new File(utility.FileUtils.RUTE_USER_VIDEO);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        
        if(video != null){
            String contentType = video.getContentType();
            fileExt = utility.FileUtils.GetExtension(contentType);
            nameVideo = video.getName() + System.currentTimeMillis() + fileExt;
            File videoFile = new File(fileSaveDir, nameVideo);
            videoPath = videoFile.toPath().toString();
            video.write(videoPath);
        }
        
        return new MultimediaFile(videoPath, nameVideo, fileExt, 'v');
    }
}
