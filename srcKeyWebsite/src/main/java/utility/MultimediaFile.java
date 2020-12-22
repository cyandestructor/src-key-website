/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

/**
 *
 * @author delli
 */
public class MultimediaFile {
    
    private String filePath;
    private String filename;
    private String extension;
    private char fileType;

    public MultimediaFile(String filePath, String filename, String extension, char fileType) {
        this.filePath = filePath;
        this.filename = filename;
        this.extension = extension;
        this.fileType = fileType;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public char getFileType() {
        return fileType;
    }

    public void setFileType(char fileType) {
        this.fileType = fileType;
    }
    
}
