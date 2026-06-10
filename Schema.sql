Schema.sql
CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(100),
    country VARCHAR(50),
    website VARCHAR(255)
);

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30)
);

CREATE TABLE ESG_Report (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    report_year YEAR,
    report_file VARCHAR(255),
    upload_date DATE,
    FOREIGN KEY (company_id)
    REFERENCES Company(company_id)
);

CREATE TABLE ESG_Score (
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT UNIQUE,
    environmental_score DECIMAL(5,2),
    social_score DECIMAL(5,2),
    governance_score DECIMAL(5,2),
    total_esg_score DECIMAL(5,2),
    FOREIGN KEY (report_id)
    REFERENCES ESG_Report(report_id)
);

CREATE TABLE Risk_Prediction (
    risk_id INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT UNIQUE,
    risk_level VARCHAR(20),
    risk_score DECIMAL(5,2),
    prediction_date DATE,
    FOREIGN KEY (report_id)
    REFERENCES ESG_Report(report_id)
);

CREATE TABLE Report_Summary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    report_id INT UNIQUE,
    summary_text TEXT,
    generated_date DATE,
    FOREIGN KEY (report_id)
    REFERENCES ESG_Report(report_id)
);