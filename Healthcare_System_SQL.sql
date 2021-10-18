USE [master]
GO
/****** Object:  Database [HealthcareSystem]    Script Date: 18-Oct-21 11:16:57 AM ******/
CREATE DATABASE [HealthcareSystem]
GO
USE [HealthcareSystem]
GO
ALTER DATABASE [HealthcareSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealthcareSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealthcareSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealthcareSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealthcareSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealthcareSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HealthcareSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealthcareSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealthcareSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealthcareSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealthcareSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealthcareSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealthcareSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealthcareSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealthcareSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HealthcareSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealthcareSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealthcareSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealthcareSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HealthcareSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealthcareSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HealthcareSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealthcareSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HealthcareSystem] SET  MULTI_USER 
GO
ALTER DATABASE [HealthcareSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealthcareSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HealthcareSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HealthcareSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HealthcareSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HealthcareSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HealthcareSystem] SET QUERY_STORE = OFF
GO
USE [HealthcareSystem]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[author_id] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NULL,
	[date] [date] NULL,
	[slot_id] [int] NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[date] [date] NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor_Feedbacks]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor_Feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[content] [nvarchar](max) NULL,
	[rate] [int] NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[phone] [nvarchar](10) NULL,
	[email] [nvarchar](max) NULL,
	[role] [nvarchar](max) NULL,
	[type_id] [int] NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[phone] [nvarchar](10) NULL,
	[email] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[patient_id] [int] NULL,
	[service_id] [int] NULL,
	[price] [real] NULL,
	[status] [int] NULL,
	[slot_id] [int] NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service_Feedbacks]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service_Feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[rate] [int] NULL,
	[patient_id] [int] NULL,
	[service_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[type_id] [int] NULL,
	[image] [nvarchar](max) NULL,
	[description] [text] NULL,
	[price] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialities]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialities](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 18-Oct-21 11:16:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[slot_id] [int] IDENTITY(1,1) NOT NULL,
	[time] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (1, N'admin', N'admin', 0, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (2, N'doctor1', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (3, N'doctor2', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (4, N'doctor3', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (5, N'doctor4', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (6, N'doctor5', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (7, N'doctor6', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (8, N'doctor7', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (9, N'doctor8', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (10, N'doctor9', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (11, N'doctor10', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (12, N'doctor11', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (13, N'doctor12', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (14, N'doctor13', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (15, N'doctor14', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (16, N'doctor15', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (17, N'doctor16', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (18, N'doctor17', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (19, N'doctor18', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (20, N'doctor19', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (21, N'doctor20', N'12345', 1, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (22, N'patient1', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (23, N'patient2', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (24, N'patient3', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (25, N'patient4', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (26, N'patient5', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (27, N'patient6', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (28, N'patient7', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (29, N'patient8', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (30, N'patient9', N'12345', 2, 1)
GO
INSERT [dbo].[Accounts] ([account_id], [username], [password], [author_id], [status]) VALUES (31, N'patient10', N'12345', 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 
GO
INSERT [dbo].[Blogs] ([blog_id], [title], [date], [image], [description]) VALUES (1, N'Percutaneous heart valve replacement', CAST(N'2020-05-17' AS Date), N'https://vinmec-prod.s3.amazonaws.com/images/20190426_040437_971221_hep-ho-van-dong-mac.max-1800x1800.jpg', N'The article was professionally consulted by Dr. Nguyen Van Duong - Interventional Cardiologist - Cardiovascular Center - Vinmec Central Park International General Hospital.

Percutaneous valve replacement without surgery is one of the most complex heart valve replacement techniques in the world, helping patients'' health to be significantly improved, especially the ability to recover quickly. Vinmec is the first hospital in Vietnam to perform this technique independently. Please refer to the non-surgical percutaneous valve replacement at Vinmec to better understand this method.

1. What is transcatheter aortic valve replacement (TAVI)?
Percutaneous aortic valve replacement is currently an alternative to aortic valve replacement surgery in patients with aortic stenosis and at very high surgical risk or no longer indicated for surgery. The valve is attached to a device that is threaded through the skin into the ascending femoral artery and attached to the aortic valve.

Percutaneous aortic valve replacement was first used in patients with tight aortic stenosis who were refused surgery by surgeons due to the high risk of surgery in 2002 and was performed by Dr. Interventional cardiologist Dr. Alain Cribier. Officially and regularly applied for about 10 years now. Currently, Vinmec is the first hospital in Vietnam to perform this technique independently.

2. Designated object
This method is only applicable to patients who:

Patients over 60 years of age with severe aortic stenosis (valvular orifice area < 1 cm2, mean transvalvular gradient > 40 mmHg).
Have aortic and peripheral artery anatomy appropriate to the technique.
Have a desire to perform TAVI.
Approved by the cardiology team (heart team including internal cardiologist, cardiothoracic surgeon, interventional cardiologist, anesthesiologist) approved.
Patients with aortic valve stenosis
Elderly patients with severe aortic stenosis can apply the technique
banner image

3. Implementation process
This method is done through the following steps:

Step 1: The patient will be performed laboratory tests (echocardiography, CT scan as well as other blood tests) to assess the anatomical fit of the valve structure and blood vessels. Coronary angiography and aortic arch, access artery assesses the extent of damage to the coronary system, the degree of calcification of the aortic valve as well as the vascular access.

Step 2: Consultation through the cardiology team to get consensus and appropriate appointment for the patient. Explain to patients and relatives the indications, costs, possible complications before, during and after the procedure.

Step 3: Do the trick.

Outstanding advantage

Percutaneous aortic valve replacement is one of the most modern and complex heart valve replacement techniques in the world. With this technique, doctors will thread a tube through the skin from the femoral artery to the aorta to replace the heart valve, which increases the likelihood of success, reduces the risk of bleeding, and avoids many dangerous complications.
This method is less invasive, gentler and simpler than conventional aortic valve replacement surgery. Doctors do not have to drive along the patient''s sternum, do not have to run an artificial cardiopulmonary bypass machine, do not have general anesthesia, so the risk of complications is minimized.
The patient''s recovery time is also faster, only 2-6 days compared to 1-2 weeks if open surgery.
This is considered a lifeline for patients who cannot tolerate surgery because of old age, weakness or chronic diseases.

4. Why should this technique be done at Vinmec?
Percutaneous aortic valve replacement patient at Vinmec
Percutaneous aortic valve replacement patient at Vinmec
Vinmec is the only place in Vietnam that is equipped with a Hybrid room equipped with advanced equipment such as DSA angiography machine, anesthesia machine with the most closely integrated patient hemodynamic monitoring software (PiCCO system, entropy...). Therefore, Hybird operating room can meet the requirements of surgery and angioplasty, coronary stenting, aortic stent graft, open heart surgery, heart valve replacement for congenital heart diseases with the least invasive technique. , safely help patients recover health soon.

The cardiology team works in unity and mutual support, doctors Pham Thanh Van, doctor Nguyen Van Phong, doctor Le Duc Hiep who participated in performing the surgery are all trained directly by foreign experts.

As the only place in Vietnam awarded the certificate of "Independent aortic valve replacement center in Vietnam" and Prof. Vo Thanh Nhan is the first interventional cardiologist to be awarded the "Proctor" certificate in Vietnam. Vinmec''s further goal is to become an excellent interventional cardiology center according to US standards, integrating with the world''s level of cardiovascular intervention. ')
GO
INSERT [dbo].[Blogs] ([blog_id], [title], [date], [image], [description]) VALUES (2, N'Robotic-assisted laparoscopy', CAST(N'2020-05-15' AS Date), N'https://vinmec-prod.s3.amazonaws.com/images/20191022_152728_263158_phau-thuat-robot-vi.max-1800x1800.jpg', N'Robotic-assisted laparoscopy

Posted by Master, Doctor Nguyen Ngoc Khanh - Head of Department of Gastroenterology - Urology - Robotic Surgery & Pediatric Surgery, Vinmec Times City International General Hospital.

Robotic surgery with sophisticated structure can meet the surgical needs with the highest requirements. The article aims to provide readers with basic information about the history of development, generations of surgical robots, operation methods and achievements of current robotic surgery, especially the most modern surgical robots today. - Da Vinci.

1. History of surgical robot development
The term "robot" was first used by Czech playwright Karel Capek in 1921 in his play Rossom''s Universal Robots. It comes from the word “robota”, which means “forced labor”.
The world''s first surgical robot was Arthrobot, used in Vancouver, Canada in 1983.
In 1985, the robot PUMA560, performed CT-guided brain biopsies.
In 1988, the robot PROBOT, at Imperial College London, performed prostate surgery.
In 1992, Integrated Corporation''s ROBODOC robot performed precise femur grinding in hip replacement surgery, being the first robot approved by the FDA in 2008.
In 1994, the first endoscopic camera holder AESOP robot was approved by the FDA. NASA funded Computer Motion, the company that produced AESOP, with the goal of creating a robotic arm that could be used in space but ended up being the center-camera arm in laparoscopic surgeries.
The voice control upgrade was introduced in 1996 with AESOP 2000.
Upgrading the 7-way operation to mimic the human hand was implemented in 1998 with AESOP 3000.
ZEUS was introduced commercially in 1998 and started the idea of ​​remote robotic surgery.
The merger of two companies Intuitive Surgical (founded 1995, products are Mona and Leonardo robots) with Computer Motion (the company that created the voice-controlled AESOP surgical robots and ZEUS remote surgery) in March, 2003 brought the surgical robotics industry to the next level, creating the Da Vinci surgical robotic system.
Da Vinci has now produced up to the fourth generation Xi and the SP series of Single Incision Surgical Robots.
2. Classification of Surgical Robots
Depending on the classification criteria, there are different classifications. Based on the autonomous operation of the robot, it can be temporarily divided into 3 types:

Active system: The robot operates essentially automatically (while still under the surgeon''s control) and performs pre-programmed tasks. PROBOT and ROBODOC are good examples of this system.
Semi-active system: Partial automatic mixing with surgeon control.
Passive system (Master–slave system): Operates under the complete control of the surgeon (Vinci® and ZEUS) without any pre-programming.
3. How Surgical Robots Work Today 
Active system: The robot operates essentially automatically (while still under the surgeon''s control) and performs pre-programmed tasks. PROBOT and ROBODOC are good examples of this system.
Semi-active system: Partial automatic mixing with surgeon control.
Passive system (Master–slave system): Operates under the complete control of the surgeon (Vinci® and ZEUS) without any pre-programming.
3. How Surgical Robots Work Today
Diagram of the robot system
Diagram of robotic surgery system
The robot has 3 separate but interconnected parts:

The vision cart includes an endoscope camera, camcorder, computer - microprocessor - robot brain and other devices to create a 3D image of the operation.
The da Vinci Xi . Surgical Robot System
The da Vinci Xi . Surgical Robot System
The tower, patient cart is a robotic component that directly performs surgery on a patient. It has robotic arms (4 arms), 3 of which can hold different surgical instruments and one holds a 3D camera. These arms are controlled by a computer that is able to accurately process and reproduce the movements of the surgeon''s hand. Articulated surgical instruments are connected to the robot''s arm and inserted into the patient''s body through a small tube called a cannule. The surgeon''s hand movements are scaled and filtered by the computer to remove the vibrations caused by hand tremors which are then converted into corresponding micro-motions of the surgical instruments. At the same time, the camera delivers realistic 3D images to the surgeon''s console. The reduction ratio can be adjusted, for example, if we choose 3:1 ratio, when the surgeon''s hand moves 6cm, the robot''s instrument moves exactly and 2cm respectively.
Robot Tower
Robot Tower
The console is where the surgeo... (134 KB left)')
GO
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (1, N'Phiplippe Macaire', 1, CAST(N'1984-06-28' AS Date), N'0913028592', N'philippe02@gmail.com', N'Head of Department of Anesthesiology', 1, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'Professor, Doctor, Doctor Philippe Macaire has devoted more than 30 years in the field of Anesthesia - pain treatment, is a strong expert in: Anesthesia and resuscitation in pediatric surgery. Difficult airway management and difficult intubation. Ultrasound-guided vertebral plane (ESP) anesthesia for open-heart and thoracic surgery, new technique for the treatment of non-opioid pain. Monitoring ventilation for obese patients during bariatric surgery. Palliative care for the sick.', 2)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (2, N'Khanritonchyk Aksana', 0, CAST(N'1990-12-20' AS Date), N'0382932501', N'aksana2012@gmail.com', N'Doctor of Obstetrics and Gynecology ', 10, N'https://vinmec-prod.s3.amazonaws.com/images/18_02_2019_07_24_42_217499.jpeg', N'Dr. Kharitonchyk Aksana has more than 20 years of experience in the field of Obstetrics and Gynecology, especially in treating fibroids, cysts, urinary incontinence, perimenopausal disorders, menopause, prenatal diagnosis. , genetic diseases, pregnancy management, treatment of male diseases, social diseases and male and female infertility...', 3)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (3, N'Reinel Martin', 1, CAST(N'1975-06-11' AS Date), N'0385923123', N'martin12n@gmail.com', N'Cardiologist', 4, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMJzEZNXtuRhy2YQE3p4mRfv6VhCsN2mWSEw&usqp=CAU', N'Master, Dr. Reinel Martin Alvarez Plasencia has 23 years of experience working in the field of Cardiology, especially with strong expertise in echocardiography and the treatment of cardiovascular diseases including hypertension, arterial disease. coronary, valvular diseases, heart failure, cardiomyopathies, cardiovascular diseases systemic disorders, dyslipidemia, congenital heart disease and arrhythmias.', 4)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (4, N'Thanh Nhan', 1, CAST(N'1980-07-12' AS Date), N'0386123824', N'thanhnhan@gmail.com', N'Cardiologist ', 2, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'The first expert in Vietnam on percutaneous arterial intervention (TAVI), has 40 years of experience teaching in the field of Cardiology at the University of Medicine and Pharmacy in Ho Chi Minh City, Cho Ray Hospital.', 5)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (5, N'Pham Nhat An', 1, CAST(N'1988-09-17' AS Date), N'0273856283', N'anpn1709@gmail.com', N'Pediatrics Department', 11, N'https://vinmec-prod.s3.amazonaws.com/images/05_01_2019_03_03_31_362064.jpeg', N'Prof. TS.BS Pham Nhat An has 45 years of experience in the field of Pediatrics, specializing in examination, diagnosis and treatment of diseases in infants and young children; infectious diseases in children.', 6)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (6, N'Selina M.luger', 0, CAST(N'1970-02-16' AS Date), N'0982731834', N'lugelsm@gmail.com', N'Oncology-Radiotherapy', 13, N'https://www.pennmedicine.org/-/media/mpd/providers/luger_selina.jpg', N'30 years of experience working in the field of oncology - radiation therapy, specializing in cancer treatment and malignant hematological diseases.', 7)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (7, N'Tran Thanh Cang', 1, CAST(N'1968-09-11' AS Date), N'0823748292', N'canhnt283@gmail.com', N'Professional Director and Head of Emergency Resuscitation Department', 16, N'https://vanhocsaigon.com/wp-content/uploads/2020/03/Tran-Thanh-Canh-vhsg-1a.jpg', N'Assoc. Dr. Dr. Tran Thanh Cang has nearly 40 years of experience in the field of Emergency Resuscitation and is a leading expert in medical resuscitation and poison control in Hai Phong''s health sector. ', 8)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (8, N'Ton That Tri Dung', 1, CAST(N'1970-09-08' AS Date), N'0781239238', N'tttdung1@gmail.com', N'Head of Department of Medical Examination & Internal Medicine', 5, N'https://vinmec-prod.s3.amazonaws.com/images/01_07_2020_07_18_25_145197.jpeg', N'Doctor. Dr. Ton That Tri Dung has over 20 years of experience in neurology, specializing in neuroendocrine diseases - stroke; brain circuit intervention techniques; Examination, consultation and treatment of endocrine diseases and respiratory diseases.', 9)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (9, N'Nguyen Dang Tuan', 1, CAST(N'1982-01-10' AS Date), N'0832456114', N'tuandlm@gmail.com', N'Head of Subcommittee on Emergency Resuscitation of the Health System', 6, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'Dr. Nguyen Dang Tuan - Head of the Emergency Resuscitation Subcommittee of Vinmec Health System, Head of the Organ Transplant Resuscitation and Surgery Unit of the Intensive Care Unit of Vinmec Times City Hospital. Doctor of Medicine specializing in Anesthesiology and Resuscitation, former resident of HSCC specialized hospital, Hanoi Medical University, with extensive experience in the field of Emergency Resuscitation (12 years working in the Department of Resuscitation). active in Bach Mai Hospital; 03 years at the HSCC Department of Vinmec Times City Hospital). Official member of the World Association of Cardiopulmonary Machine (ELSO) (Extracorporeal Life Support Organization)', 10)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (10, N'Le Trong Binh', 1, CAST(N'1969-02-25' AS Date), N'0393728371', N'binhlt182@gmail.com', N'Head of Department of General Surgery', 9, N'https://vinmec-prod.s3.amazonaws.com/images/01_07_2020_06_49_06_620563.jpeg', N'Specialist I Le Trong Binh has more than 28 years of experience working in the field of Anesthesiology and Resuscitation, especially has strengths in: Anesthesiology: Cranial neurosurgery, thoracic surgery, cardiovascular surgery. , vascular interventions in adults and children. Anesthesia, analgesia for gastrointestinal, urological, endocrine, orthopedic surgery.', 11)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (11, N'Doan Xuan Sinh', 1, CAST(N'1975-03-12' AS Date), N'0365854235', N'dxs321@gmail.com', N'Head of Diagnostic Imaging', 7, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'Specialist Doan Thi Hong Hanh has more than 28 years of experience working in the field of Anesthesiology and Resuscitation, especially has strengths in: Anesthesiology: Cranial neurosurgery, thoracic surgery, cardiovascular surgery. , vascular interventions in adults and children. Anesthesia, analgesia for gastrointestinal, urological, endocrine, orthopedic surgery.', 12)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (12, N'Doan Thi Hong Hanh', 0, CAST(N'1970-12-23' AS Date), N'0238472345', N'honghanh12@gmail.com', N'Head of the department', 16, N'https://vast.gov.vn/documents/20182/9219222/100nhakhtieubieuchaua.jpg/9d2de8e4-9732-4bdd-a7d2-ede48c8e1236?t=1592898843420', N'Dr. Doan Thi Hong Hanh has more than 30 years of experience in the field of microbiology testing, especially in clinical microbiology, consulting on drug resistance of pathogenic bacteria and culturing, isolating, identifying, and microbiological antibiotics. pathogenic bacteria, microbiological immunoassays…', 13)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (13, N'Alyssa A. Grissom', 0, CAST(N'1980-11-21' AS Date), N'0355054625', N'anhtronsds2@gmail.com', N'Nursing Specialist', 21, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'Master Alyssa A. Grissom has many years of experience in the field of clinical oncology nursing. MSc Alyssa A. Grissom has deep expertise in Adult Care Clinical nursing (caring for patients from infancy to old age). Caring for patients treated with chemotherapy and biologic therapy. MSc Alyssa A. Grissom received her Master''s degree from Loyola University Chicago (Maywood, Illinois) in December 2015. She attended intensive training courses in Cancer Risk Assessment at City of Hope and received a great deal. many professional certifications and certifications. Master Alyssa A. Grissom has many articles such as Presentation on the topic Genetic Cancer Risk Assessment: Implications for Oncology Nursing, 18th Annual Oncology Nursing Workshop at Northwestern Memorial Hospital ( 2015). Practitioner in Oncology (2016). Presentation on the topic of chemotherapy and biological therapy Multi-Gene Panel Testing for Hereditary Cancer Risk. Journal of the Advanced for Non-Cancer Issues, Nursing Training in the Great Halls of Christ Medical Center (2017). Nursing Care Plans: Diagnosis interventions and outcomes 10th edition. Print press. M. Gulanick and G.L. Myers ed. AA Grissom - Edited oncology related chapters and content to reflect evidence-based nursing practice, new technologies, new treatment modalities, and oncology standards of care. MSc Alyssa A. Grissom is also a member of the Oncology Nursing Association. Currently, Master Alyssa A. Grissom is holding the position of Nursing Specialist working at the Department of Oncology - Hematology at Vinmec Times City International Hospital.', 14)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (14, N'Vu Hong Thang', 1, CAST(N'1972-02-21' AS Date), N'0346284664', N'thangmnhj21@gmail.com', N'Oncology specialist', 19, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'Associate Professor, Doctor, Doctor Vu Hong Thang has 26 years of experience working in the field of Oncology - Radiation Therapy, especially as an oncologist, specializing in breast cancer - gynecological diseases. , lung cancer, liver cancer, gallbladder, pancreas,... He is a doctor with a noble heart with the practice motto "Saving people is the greatest joy of the medical profession.". In 2015, he was honored to receive the title of Associate Professor of Medicine, a golden milestone marking his devoted career in the medical industry. Moreover, in the same year 2015 he also became the typical face of the medical industry on the occasion of 60 years of medical profession. Especially in 2018, Associate Professor Thang was honored with the Medal for the development of the medical industry. In order to achieve these resounding achievements, he has always made efforts to study and improve his expertise through many intensive courses in Sweden, Australia, Malaysia, and Singapore. At the same time, he also showed his enthusiasm in the profession through more than 100 scientific research works, articles that have great impact and bring effective applications in practice.', 15)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (15, N'Pham Ngoc Hoa', 1, CAST(N'1980-05-22' AS Date), N'032812937', N'hoa123@gmail.com', N'Doctor Diagnostic Imaging', 7, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCHB49DTKydTDhMIDTcOpNR0xZAkBwR3Rl_A&usqp=CAU', N'BSCK I Pham Ngoc Hoa has many years of experience in the field of Diagnostic Imaging, specializing in reading results (MRI, CT, X-ray); ultrasound (General, Cardiac, Vascular, Thyroid and Gynecological 3D, 4D); perform FNA of breast, thyroid and other tumors under ultrasound guidance.', 16)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (16, N'Ha Thi Thu Hien', 0, CAST(N'1981-09-18' AS Date), N'083742385', N'hienhtt@gmail.com', N'Doctor of Pathology', 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5oimKME3e8_ahq-viHRcrfaayrM3EUfORUg&usqp=CAU', N'Dr. Ha Thi Thu Hien has 19 years of experience in the field of pathology, pathological testing. Dr. Hien graduated with a Master''s degree in Pathology from Hanoi Medical University in 2009. After that, he worked for a long time at the Department of Pathology - Viet Duc Hospital. Currently, Dr. Hien is a Pathologist - Laboratory Department - Vinmec Times City International Hospital.', 17)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (17, N'Nguyen Viet Nhan', 1, CAST(N'1983-05-20' AS Date), N'034879522', N'nhannth21@gmail.com', N'Genetic Consultant', 3, N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/201178265_791166488437701_4752149825760262223_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=825194&_nc_ohc=M3WebZcQSWUAX9KoEvH&_nc_ht=scontent.fhan3-3.fna&oh=b4e4b98139e4215a0e2cb9be6fa14d2f&oe=617C9A8C', N'Assoc. Dr. Dr. Nguyen Viet Nhan has 45 years of experience in the field of Medical Genetics, specializing in genetic counseling for pregnant women with malformations and couples who have given birth to children with birth defects. genetic pathology, screening counseling - prenatal and neonatal diagnosis, premarital counseling. He was formerly Head of Physiology Department, Head of Medical Genetics Department, Deputy Director of Institute of Biomedicine at Hue University of Medicine and Pharmacy. Assoc. Dr. Dr. Nguyen Viet Nhan is currently a Genetic Consultant - Department of Fetal Medicine - Women''s Health Center - Vinmec Times City International Hospital.', 18)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (18, N'Do Thi Ngoc Lan', 0, CAST(N'1967-05-01' AS Date), N'0198541365', N'lanngbam3@gmail.com', N'Doctor of Obstetrics and Gynecology ', 5, N'https://vinmec-prod.s3.amazonaws.com/images/15_08_2019_03_13_38_444466.jpeg', N'BSCK II Do Thi Ngoc Lan has over 30 years of experience in the field of Obstetrics and Gynecology, specializing in infertility surgery, gynecology, genital malformations, genital prolapse, laparoscopic treatment of ectopic pregnancy, fibroids uterus, ovarian cyst. She was the former Head of the Department of Gynecology and Surgery (Gynecology Department I) - National Hospital of Obstetrics and Gynecology, and was awarded the title of Excellent Doctor. Doctor II Do Thi Ngoc Lan is currently an Obstetrician and Gynecologist - Women''s Health Center - Vinmec Times City International Hospital.', 19)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (19, N'Pham Thi Thu Huong', 0, CAST(N'1988-05-25' AS Date), N'0826327465', N'huongas12@gmail.com', N'Head of Internal Gastroenterology - Hepatobiliary Unit', 17, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFGp4Zn855TGrbAgkrPl5kE4iRfLFOxN5FQA&usqp=CAU', N'MSc. Pham Thi Thu Huong has nearly 30 years of experience in the field of Gastroenterology - Hepatobiliary tract, specializing in the treatment of gastrointestinal - hepatobiliary diseases, intestinal lesions, endoscopic diagnosis of the stomach, colon colon, small intestine, early cancer screening, submucosal tumor diagnosis, biliary tract and pancreatic diseases.', 20)
GO
INSERT [dbo].[Doctors] ([doctor_id], [name], [gender], [dob], [phone], [email], [role], [type_id], [image], [description], [account_id]) VALUES (20, N'Pham Thi Thu Huong', 0, CAST(N'1988-05-25' AS Date), N'0826327465', N'huongas12@gmail.com', N'Head of Internal Gastroenterology - Hepatobiliary Unit', 17, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFGp4Zn855TGrbAgkrPl5kE4iRfLFOxN5FQA&usqp=CAU', N'MSc. Pham Thi Thu Huong has nearly 30 years of experience in the field of Gastroenterology - Hepatobiliary tract, specializing in the treatment of gastrointestinal - hepatobiliary diseases, intestinal lesions, endoscopic diagnosis of the stomach, colon colon, small intestine, early cancer screening, submucosal tumor diagnosis, biliary tract and pancreatic diseases.', 21)
GO
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (1, N'Nguyen Van Truong', 1, CAST(N'2000-06-11' AS Date), N'0383567111', N'annv12@gmail.com', N'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/242537042_3083800925231735_4947795203312758325_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=b9115d&_nc_ohc=tgwFKVQX5AcAX9wbtfn&_nc_ht=scontent.fhan3-4.fna&oh=13a4efe2196c90138e67ceda0ea3e5c8&oe=617C5B16', 22)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (2, N'Nguyen Thi Vanh', 0, CAST(N'2000-02-12' AS Date), N'0312385923', N'vanh192@gmail.com', N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/241564360_1473413899695590_8154715865166002527_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=b9115d&_nc_ohc=xuPkBc9alCcAX8NYVOX&tn=u1P-gP8ACMpYg8Yi&_nc_ht=scontent.fhan3-3.fna&oh=12c3da1f8814d40de3e14ab00eea091f&oe=617C7BFD', 23)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (3, N'Ngo Duy Toan', 1, CAST(N'1999-08-29' AS Date), N'0192758234', N'toannd01@gmail.com', N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/241564360_1473413899695590_8154715865166002527_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=b9115d&_nc_ohc=xuPkBc9alCcAX8NYVOX&tn=u1P-gP8ACMpYg8Yi&_nc_ht=scontent.fhan3-3.fna&oh=12c3da1f8814d40de3e14ab00eea091f&oe=617C7BFD', 24)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (4, N'Le Thi Trung', 1, CAST(N'1997-11-26' AS Date), N'0128393451', N'trunglt012@gmail.com', N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/241564360_1473413899695590_8154715865166002527_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=b9115d&_nc_ohc=xuPkBc9alCcAX8NYVOX&tn=u1P-gP8ACMpYg8Yi&_nc_ht=scontent.fhan3-3.fna&oh=12c3da1f8814d40de3e14ab00eea091f&oe=617C7BFD', 25)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (5, N'Dinh Thi Nhu', 0, CAST(N'1980-03-25' AS Date), N'0213741821', N'nhunt11@gmail.com', N'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/241495569_1470535206650126_5921393796434499586_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=b9115d&_nc_ohc=6I3tnxAkgjQAX_t_L-c&_nc_ht=scontent.fhan3-4.fna&oh=070f6358c1a7ca4788a4f9e5c4e67ae2&oe=617AB809', 26)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (6, N'Kieu Viet Lam', 0, CAST(N'1999-05-27' AS Date), N'0283812362', N'kvl012@gmail.com', N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/241564360_1473413899695590_8154715865166002527_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=b9115d&_nc_ohc=xuPkBc9alCcAX8NYVOX&tn=u1P-gP8ACMpYg8Yi&_nc_ht=scontent.fhan3-3.fna&oh=12c3da1f8814d40de3e14ab00eea091f&oe=617C7BFD', 27)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (7, N'Nhu Van Kien', 1, CAST(N'1997-09-19' AS Date), N'0913000275', N'kien0182@gmail.com', N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/241564360_1473413899695590_8154715865166002527_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=b9115d&_nc_ohc=xuPkBc9alCcAX8NYVOX&tn=u1P-gP8ACMpYg8Yi&_nc_ht=scontent.fhan3-3.fna&oh=12c3da1f8814d40de3e14ab00eea091f&oe=617C7BFD', 28)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (8, N'Kieu Van Linh', 1, CAST(N'2005-03-22' AS Date), N'0927851234', N'linhnt1285@gmail.com', N'https://scontent.fhan4-1.fna.fbcdn.net/v/t1.6435-9/237638143_1494715690897204_9026484317449560289_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=b9115d&_nc_ohc=RF12WUO5AdcAX-RYOpL&_nc_ht=scontent.fhan4-1.fna&oh=4c41f25f3673022530c3268c9dd2f6bb&oe=617BD574', 29)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (9, N'Nho Mai Anh', 0, CAST(N'2000-11-13' AS Date), N'0383561234', N'anhmtnhs12305@gmail.com', N'https://scontent.fhan3-4.fna.fbcdn.net/v/t1.6435-9/p480x480/240216883_3031580053785439_8179834460106778074_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=b9115d&_nc_ohc=LlIyaj-AS0QAX-t6k3O&_nc_ht=scontent.fhan3-4.fna&oh=04a9707ec9bd4dca4731d6abbd367640&oe=617BCBA3', 30)
GO
INSERT [dbo].[Patients] ([patient_id], [name], [gender], [dob], [phone], [email], [image], [account_id]) VALUES (10, N'Nguyen Truong An', 1, CAST(N'1997-09-19' AS Date), N'0973567588', N'annt982@gmail.com', N'https://scontent.fhan3-3.fna.fbcdn.net/v/t1.6435-9/241564360_1473413899695590_8154715865166002527_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=b9115d&_nc_ohc=xuPkBc9alCcAX8NYVOX&tn=u1P-gP8ACMpYg8Yi&_nc_ht=scontent.fhan3-3.fna&oh=12c3da1f8814d40de3e14ab00eea091f&oe=617C7BFD', 31)
GO
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (1, N'Maternity packages', 8, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Pregnancy is divided into trimesters (each trimester is 3 months). Understanding the stages of pregnancy will help mothers easily monitor the status of mother and baby as well as make appropriate adjustments in nutrition and activities. In particular, in each trimester, scientists also give the necessary orientations that mothers need to remember to best check the pregnancy process. Participating in the "Comprehensive pregnancy roadmap with Vinmec experts" will help mothers gain the knowledge, experience and necessary notes at each stage of pregnancy.', 350000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (2, N'Umbilical ord blood', 10, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'MSC stem cells from umbilical cord are cells that can divide and differentiate into many different types of cells to form connective tissues such as bone, cartilage, fat, muscle or nerve cells, muscle cells. With this "miracle" ability, stem cells can replace damaged cells to maintain and ensure the normal development of the body. Storing umbilical cord stem cells is considered a life-time bioinsurance for children and their loved ones because it can be used to support and treat more than 100 different diseases. Among them are many dangerous diseases such as cancer, cardiovascular disease, diabetes, autism, brain/spinal cord injury, autoimmune diseases, osteoarthritis, cirrhosis, lung disease, wound healing, aesthetic medicine. beauty, anti-inflammatory, restore tissue/organ damage... Realizing the importance and breakthrough in treatment methods and diverse applications of umbilical cord stem cell storage, Vinmec International General Hospital has established Vinmec High-Tech Center - Vinmec Cellular Bank. The first umbilical cord stem cell in Vietnam operates under a closed, professional and modern process.', 200000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (3, N'Cancer Screening', 15, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Being diagnosed with cancer but don''t know if it should be treated or not. You are afraid that treatment will make the disease progress faster. You are suffering from pain, fatigue and torment. You suffer from side effects from chemotherapy and radiation day and night. There are too many treatment and support methods online but you don''t know which method to follow', 2000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (4, N'Sewing wound at home', 21, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Currently, the demand for home wound care services such as changing wound dressings, cutting sutures at home has become more popular. However, wound care sometimes becomes confusing for family members and patients because they do not have the expertise and experience to care for them as well as not having enough medical tools to ensure safety when performing them. wound care at home. Understanding the urgent needs of patients, Viet Australia Family Clinic has provided home wound care services, home dressing changes, wound trimming - home suture removal, in-room suture removal. Quick, safe and convenient examination, helping patients have more time to rest, not having to travel to medical facilities to treat all kinds of wounds with experienced nurses and standard equipment.', 150000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (5, N'Take blood for testing, return results at home or work', 11, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Along with the changing living conditions, the pathology develops in many complicated directions, difficult to definitively treat and gradually erodes human health. Periodic health check-ups help detect disease risks to take appropriate preventive measures as well as diagnose diseases quickly to help patients have accurate and definitive treatment. However, testing and medical examination at the hospital often takes a lot of time and has to fast for breakfast, wait in line, etc., making patients hesitate and tired. Understanding the needs and desires of customers for convenient and quality medical services, Viet Uc Family Clinic provides home blood sampling and results delivery services. No need to travel, wait - Running results are completely accurate - Get test results within 2-4 hours - Consult a doctor as soon as results are available - Get hard copy results at home.', 150000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (6, N'Changing bandages, cutting threads at home or work', 21, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Changing dressings and cutting wounds are considered basic techniques often performed in hospitals. But because the patient''s psychology wants to be treated and cared for at home to feel comfortable and convenient, and the caregiver does not have to travel, now changing the dressing at home is being interested.', 150000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (7, N'Caring for someone who has a stroke', 13, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Taking care of a patient after a stroke is quite difficult for the patient''s family, the Stroke Care Service of Viet Australia Family Clinic helps you reduce the burden of taking care of your family member. Most post-stroke patients are unable to take care of themselves and have to rely on the help of others. A big issue is how to care for patients in the post-stroke stage at home, especially those who are still in a coma. A stroke or cerebrovascular accident occurs when the blood supply to part of the brain is suddenly stopped or reduced, and brain cells are deprived of oxygen and nutrients. Within a few minutes, brain cells begin to die, so the respective body parts controlled by it will not work, manifested by paralysis, numbness and hemiparesis, difficulty speaking or coma.... A stroke, if it occurs at a mild level, can completely restore function or leave partial sequelae and disability more or less. If a stroke is severe, it can lead to total hemiplegia, coma, or death.', 1500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (8, N'Healthcare for Diabetics', 7, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Diabetes, also known as diabetes, is one of the leading chronic diseases causing death in many countries around the world. In Vietnam, an estimated 5 million people are suffering from diabetes and this number will continue to increase if people do not know how to take care of and protect their health. Therefore, the current demand for diabetes care in big cities is increasing.', 1000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (9, N'Health care for people with high blood pressure', 4, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Blood pressure is the pressure of blood in the artery walls. It is essential for blood circulation in your body. High blood pressure occurs when blood pressure remains high for an extended period of time. This condition makes the heart work harder. As a result, high blood pressure can cause heart attack, stroke, kidney failure and even death. The care of people with high blood pressure is now also much more concerned. The best way to prevent, support and care for people with high blood pressure is to have regular health checkups. Based on many years of research and experience in the field of family health care, Viet Australia Family Clinic brings you the High Blood Pressure Care service package as a meaningful gift that you can spend. for yourself and your loved ones.', 1500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (10, N'Emergency', 21, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Understanding the importance of first aid in life and health-threatening situations, Hong Ngoc General Hospital has invested in a system of emergency vehicles and modern medical equipment available 24 hours a day. The emergency staff is well-trained in expertise and accurate first aid procedures, ensuring fast and high safety criteria in on-site treatment as well as transporting hospitalized patients.', 500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (11, N'Psychedelic Counseling', 13, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Spirituality is an asset as important as education and the material values ??you possess. You are having problems with mental stress, or have addictive behaviors (Internet, games, ..) Your spirit is down, you feel fatigue, stress, anxiety, loss of appetite and severe insomnia. Prolonged psychological tension, you don''t know who to talk to. You need advice on career development or dealing with conflicts, conflicts, crises in relationships or at work. The psychologists of Mai Huong Day Psychiatric Hospital are happy to help you. In some necessary cases, multiple tests can be conducted to compare and contrast, in order to evaluate more accurately with common clinical experience.', 1200000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (12, N'Eye examination at central hospital', 16, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Central Eye Hospital is located at Ba Trieu Street, Hai Ba Trung District, Hanoi. The hospital performs the functions and tasks of medical examination and treatment, disease prevention and rehabilitation for patients nationwide at the highest level. With a history of 60 years of establishment and development, the hospital has become a trusted place for medical examination and treatment and specialized eye treatment of people nationwide.', 1000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (13, N'Weight loss and muscle gain advice', 14, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'An unbalanced physique with little muscle, a lot of excess fat (usually in the abdomen, thighs, biceps ...) is a common obsession of many people today. Not only affects the psychology and aesthetics, this condition also entails many health risks such as cardiovascular disease, bone and joint disease, etc. The subjects at high risk of having a lot of excess fat and little muscle are people who often work in one place, are sedentary, postpartum women, people after the age of 35, 40, overweight people ... One of the effective solutions for This problem is to apply a regimen to help increase the amount of beneficial muscle for the body and destroy the harmful excess fat, especially to ensure the goal of maintaining a stable and long-term weight and muscle mass. Nutrition examination and counseling service to increase muscle and reduce excess fat at Nutrihome Nutrition Clinic System - Nutritional Medicine is for all those who want to own a toned body, without excess fat, slim abs and abs. ideal physique. In particular, Nutrihome offers a comprehensive treatment regimen with the goal of ensuring "beautiful outside - healthy inside" when combining science between nutrition and methodical and individualized exercises for each need. .', 2000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (14, N'Stomachache Cure', 9, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Direct examination with a team of good doctors, many years of experience, having worked at many big hospitals such as: Doctor, Doctor of Internal Medicine and Gastroenterology Pham Thi Binh - Former Head of the Department of Physical Education and Training of Bach Mai Hospital; Specialist Doctor II. Excellent doctor Nguyen Thi Hang – Former Head of Gastroenterology Department – ??E Hospital. Modern, advanced equipment, constantly updating the latest technology to help accurately diagnose diseases. Attentive and dedicated service. Reasonable cost, health insurance payment. Book an appointment quickly, limit waiting time.', 300000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (15, N'Facial Skin Care', 3, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'The skin is the largest organ of the body, it plays an important role as an armor that protects all internal organs. Especially the face is the brightest "facade" position of both men and women, so it deserves to be cherished and cared for every day. Dermatologists advise that: "In addition to skin care at home, women and men should go to a facial spa once a month to maintain healthy, disease-free skin".', 3000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (16, N'Stem Cell Transplant', 2, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'We provide the best stem cell storage and transportation services because we understand the importance of stem cells and their future therapeutic applications. Right at the time of birth, the umbilical cord and cord blood will be collected to be used to separate stem cells.', 5000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (17, N'Tests to evaluate kidney function', 7, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Renal failure is a condition in which kidney function declines, which can come on suddenly, called acute renal failure, or progress slowly, called chronic renal failure. In acute renal failure, renal function is reversible. Chronic kidney failure is a gradual decline in kidney function and eventually a complete loss of function. At this time, it is necessary to have supportive measures for kidney function in order for the body to survive.', 1500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (18, N'Covid PCR Test', 12, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'The COVID-19 pandemic has upended the lives of children and their families across the globe. UNICEF is working with experts to promote facts over fear, bringing reliable guidance to parents, caregivers and educators, and partnering with front-line responders to ensure they have the information and resources they need to keep children healthy and learning.', 100000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (19, N'Dental Fillings', 5, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Dental fillings at Lien Thanh Dental Clinic. Dentists at Lien Thanh Dental will advise and help you in choosing the type of material to carry out dental fillings depending on specific factors such as: requirements for prevention of tooth decay, aesthetic requirements of patients. patient, demanding on the bearing capacity of the solder… In addition, at Lien Thanh Dental Clinic, the most advanced dental filling material is applied Fuji PG (new generation solder) and a more precise beater, so the life of the weld is very high, can be from 5 to 10 years. year. Moreover, when filling teeth, the solder is machined and the filler is very small, increasing the bonding ability to help the weld be stable and withstand strong forces.', 200000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (20, N'Laser Acne Treatment', 6, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Effective laser acne treatment at Spa Zema is a proven solution in the number of customers who have been treated for acne at the root, and significantly reduced acne at the first experience. Acne is always an "obsessive" problem for women because of its ugliness that affects the skin of the face. Currently, there are many methods or technologies at acne spas that bring different effects, come to Zema to experience this fast, new acne treatment right away! Click on the image below to receive special offers!', 3000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (21, N'Nearsightedness Surgery', 16, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'ReLEx SMILE is the most advanced method of treating eye diseases such as nearsightedness today. Many people have chosen ReLEx SMILE eye surgery to say goodbye to their glasses. However, how much does ReLex SMILE eye surgery cost is still a question that many people are interested in.', 1.2E+07)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (22, N'Package of general health check', 2, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'The general health examination package of Hanoi General Hospital is designed to suit many subjects, for both men and women with high science and practicality to help timely intervene and treat diseases (if any). Customers will be examined for basic categories such as digestive system, respiratory system, nervous system, cardiovascular system ... and more specialized with blood tests, urine or diagnostic imaging to help achieve the highest efficiency. . At Hanoi General Hospital, there are 3 general health checkup packages for customers to choose from depending on the needs and purposes of each individual, including: Basic Package, Standard Package, Advanced Package. Doctors and specialists of Hanoi General Hospital will advise customers to choose the most suitable package for each customer to achieve maximum effectiveness with minimum cost.', 500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (23, N'Family doctor checkup package', 5, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Procedure for visiting a family doctor: Schedule an appointment depending on the case of an emergency or choose a time that is suitable for the customer Based on the patient''s symptoms, the doctor will conduct an examination and diagnosis of the disease. If it is possible to treat at home, the doctor will issue a prescription and guide you on how to treat, re-examine… If the disease is severe, the doctor will guide the patient to the hospital and have the appropriate treatment Family doctor service, we divide into packages to suit the needs of each patient''s family Unscheduled home examination on request Weekly and monthly check-ups', 3000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (24, N'PRE-Marriage Examination Package', 8, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'The pre-marital examination package of Hanoi General Hospital is specially designed for newly-married couples, with a full list of the most necessary examinations for customers to understand their own health before entering life. long marriage.', 2000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (25, N'Plastic surgery package', 11, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'System of one-way sterile operating room, postoperative room is invested and standardized with 5 stars according to international standards. Gathering a good advisory board, European experts with over 25 years of experience, a team of highly skilled plastic surgeons who have trained abroad. With the outstanding strength of technology, a team of experts and leading doctors. Aesthetics of Hanoi General Hospital is highly appreciated by exclusive beauty technologies such as: No Touch 3S Breast Augmentation, Nano Form 8.0 . nose lift Liposuction VASE LIPO POWER Natural Eyelids - Ultra Natural Eyelids Diamond Collagen facelift 4.0 Young Lift Thread Tension Baby fat transplant….', 5000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (26, N'Package of urinary stone examination', 11, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Many complications of urinary diseases greatly affect the body: male infections, kidney failure, blood infections, increased risk of sexually transmitted diseases, decreased psychological well-being. In particular, the rate of people suffering from infertility - infertility due to urinary tract diseases is now higher than other diseases. Kidney stones can also cause recurrent kidney infections, which is a risk factor for kidney failure. Elderly men are at risk of prostate enlargement causing urinary outlet obstruction. Monitor the progression of kidney disease in a timely manner; have a reasonable diet; do not drink beer, wine; no smoking; eat less meat, reduce fat and increase vegetables; avoid too hard labor; prevention of hypertension, if you have high blood pressure, you must treat and control your blood pressure; treatment of urolithiasis and salt restriction; urinary tract infection prevention and timely treatment of urinary tract infections.', 3E+07)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (27, N'High-tech intervention & imaging package', 15, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'The diagnostic imaging at Hanoi General Hospital is invested with the world''s leading modern machinery and equipment, synchronously imported, directly from famous brands of Germany, Japan, and the United States, helping to bring the best results. diagnostic results with high accuracy and effective procedures such as: 4D ultrasound machine, gastrointestinal endoscope, digital X-ray machine... The advanced NBI Gastroscopy / Colonoscopy system, effectively supports the observation and assessment of damage in the gastrointestinal tract, detects all diseases in the digestive system, detects H. remove polyps and gastrointestinal cancer germs even though there are no symptoms.', 1E+07)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (28, N'Thyroid and breast screening package', 12, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Thyroid cancer screening is a basic to advanced test that looks for the presence of cancer cells when there are no symptoms in the body. In other words, cancer screening will help us detect cancer early so that it can be treated easily, minimizing unwanted complications.', 2500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (29, N'Amidan cutting/drawing with no pain', 6, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Tonsillitis and VA are two of the Lymphoid organizations in the Waldeyer ring that are responsible for identifying bacteria, creating antibodies to destroy when they re-enter the body. Tonsillitis and VA can be treated medically during acute episodes of inflammation. However, in some cases of tonsillitis and VA that are overgrown or have a long-lasting, recurrent infection that seriously affects health, it is necessary to remove it for definitive treatment.', 7300000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (30, N'Endoscopic sinuses', 3, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Sinusitis is a disease of the respiratory system that can affect people of all ages. If the patient does not receive timely treatment, sinusitis can lead to a number of dangerous complications, significantly affecting the health of the sufferer.', 1500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (31, N'Treatment of cervicitis with RFA', 7, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Cervical ectropion forms when glandular cells overgrow. Invading the outside of the cervix, allowing bacteria and fungi to enter and cause disease. Currently, there are many different treatment methods, including the treatment of thyroiditis with radiofrequency waves.', 3400000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (32, N'PROCEDURES OVERVIEW VABB Vacuum Breast Suction', 10, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'DOESN''T BE POSSIBLE WITH SMALL BEAUTIFUL ANNOUNCEMENT The disease is common in women aged 30', 1300000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (33, N'HIGH FREQUENCY TUTORIAUS (RFA)', 14, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Patients will be completed HSBA by interventional doctors (examination, subclinical results, indications for intervention, commitment to intervention, ...) and an explanation of the risks and benefits of the method. at the same time for signing a commitment to implement the intervention. - If necessary, the patient will also be anesthetized before the intervention.', 2500000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (34, N'RARE TREATMENT/ ASSISTANCE OF REPRODUCTIVITY (IVF/IUI)', 19, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Oral fertility drugs are usually applied to cases of women undergoing assisted reproduction by intrauterine insemination (IUI) and in vitro fertilization (IVF). So when is the best time to take fertility drugs and how to use them effectively? The information below will help women better understand this issue and have the answer to the question of taking fertility drugs at the most appropriate time, thereby knowing how to use them effectively.', 7300000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (35, N'Advanced periodic health checkup package', 11, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Understanding the importance of general health check-up in the care and protection of public health, the team of doctors at Lac Viet Friendship Hospital have diligently researched, built and launched the package. General periodic health check for all subjects, suitable for each different age. The periodic health check-up package is designed with a full list of examinations according to a scientific process from clinical examination, to in-depth tests, imaging, functional exploration... to ensure identification and diagnosis. diagnose the disease accurately and efficiently. ', 200000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (36, N'Examination Package – Comprehensive 2', 13, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'The examination package includes 52 examination categories, suitable for both men and women of all ages, which will help detect abnormalities in the body early.', 1000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (37, N'Package – Comprehensive 4', 13, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'With the desire to help people raise their awareness in health examination and care for themselves and their families, Thu Cuc International General Hospital builds a comprehensive health check-up package and advanced comprehensive cancer screening. 4 with 53 lists of essential examinations suitable for both men and women of all ages, will help detect abnormalities in the body early to help people have a better health. This package is currently applied at Facility 2 of Thu Cuc health system.', 4000000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (38, N'Packages – Female – Pre-menopause', 14, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'Before menopause occurs, women will have to go through perimenopause. This stage occurs when a woman turns 40 and can last from 2 to 7 years. According to statistics, one in five women suffers from an intolerable psychological and physiological disturbance, the remaining 80% is in a state of little or no change. And depending on the body of each person, that change is fast or slow, sooner or later.', 2800000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (39, N'Package of examination – Health check for issuance of green card', 15, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'According to medical experts, “annual medical examination will help us detect and prevent diseases early. Bringing practical benefits in treatment, minimizing the damage and complications caused by some diseases. In particular, for people working in the food industry, periodic health checks are not only to detect and prevent diseases for themselves, but also to help prevent infection to others.', 2800000)
GO
INSERT [dbo].[Services] ([service_id], [title], [type_id], [image], [description], [price]) VALUES (40, N'Package of examination – Examination and detection of gynecological diseases', 13, N'https://vinmec-prod.s3.amazonaws.com/images/20210722_110954_471884_219436895_49203283179.max-800x800.jpg', N'4 reasons you should see a gynecologist: Early detection of inflammatory diseases and cancer of the appendages makes treatment easy and inexpensive. Prevention and early detection of urinary tract infections, uterine fibroids, cervical cancer. For advice on reproductive health, how to prevent pregnancy safely and effectively, how to keep the room clean. Detect endocrine and psychological disorders and find treatment methods. The following is a detailed table of the price of gynecological examination packages at Thu Cuc International General Hospital.', 2300000)
GO
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialities] ON 
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (1, N'Anesthetics & Recovery ')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (2, N'Autism & Cerebral Palsy ')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (3, N'Beauty ')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (4, N'Cardiology ')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (5, N'Dentistry')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (6, N'Dermatology')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (7, N'Endocrinology')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (8, N'Fertility')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (9, N'Gastroenterology')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (10, N'Gynecology & Obstetrics')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (11, N'Hematology & Blood Transfusion')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (12, N'Infectious Disease')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (13, N'Neurology')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (14, N'Nutrition')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (15, N'Oncology')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (16, N'Ophthalmology')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (17, N'Orthopedic')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (18, N'Pediatrics')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (19, N'Pharmacy')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (20, N'Physical Therapy & Rehabilitation ')
GO
INSERT [dbo].[Specialities] ([type_id], [name]) VALUES (21, N'Resuscitation & Emergency')
GO
SET IDENTITY_INSERT [dbo].[Specialities] OFF
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (1, N'7h - 8h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (2, N'8h - 9h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (3, N'9h - 10h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (4, N'10h -11h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (5, N'11h - 12h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (6, N'14h - 15h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (7, N'15h - 16h')
GO
INSERT [dbo].[Timetable] ([slot_id], [time]) VALUES (8, N'16h -17h')
GO
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__F3DBC572F7770DBA]    Script Date: 18-Oct-21 11:16:57 AM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patients] ([patient_id])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([slot_id])
REFERENCES [dbo].[Timetable] ([slot_id])
GO
ALTER TABLE [dbo].[Doctor_Feedbacks]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[Doctor_Feedbacks]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patients] ([patient_id])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[Specialities] ([type_id])
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patients] ([patient_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([service_id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Timetable] FOREIGN KEY([slot_id])
REFERENCES [dbo].[Timetable] ([slot_id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Timetable]
GO
ALTER TABLE [dbo].[Service_Feedbacks]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patients] ([patient_id])
GO
ALTER TABLE [dbo].[Service_Feedbacks]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[Services] ([service_id])
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[Specialities] ([type_id])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD CHECK  ((NOT [phone] like '%[^0-9]%' AND len([phone])>=(8) AND len([phone])<=(10)))
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD CHECK  ((NOT [phone] like '%[^0-9]%' AND len([phone])>=(8) AND len([phone])<=(10)))
GO
USE [master]
GO
ALTER DATABASE [HealthcareSystem] SET  READ_WRITE 
GO
