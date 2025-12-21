package model;

import java.sql.Timestamp;

public class Application {
    private int id;
    private int recruitId;
    private String name;
    private Integer grade;
    private String major;
    private String message;
    private Timestamp createdAt;

    private String fileName;
    private String fileOriginal;
    private String fileSaved;
    private String filePath;
    private Long fileSize;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getRecruitId() { return recruitId; }
    public void setRecruitId(int recruitId) { this.recruitId = recruitId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getGrade() { return grade; }
    public void setGrade(Integer grade) { this.grade = grade; }

    public String getMajor() { return major; }
    public void setMajor(String major) { this.major = major; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getFileOriginal() { return fileOriginal; }
    public void setFileOriginal(String fileOriginal) { this.fileOriginal = fileOriginal; }

    public String getFileSaved() { return fileSaved; }
    public void setFileSaved(String fileSaved) { this.fileSaved = fileSaved; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public Long getFileSize() { return fileSize; }
    public void setFileSize(Long fileSize) { this.fileSize = fileSize; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

}
