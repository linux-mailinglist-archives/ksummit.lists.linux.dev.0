Return-Path: <ksummit+bounces-2066-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC90B1B9F6
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A9A918A1415
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE77292B25;
	Tue,  5 Aug 2025 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dYKmTW0h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CRlAgaET"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26174E55A
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754418237; cv=fail; b=JZuduYbaQl6MV5nlxfeE9AB8AVBbOezBpZ/Osk/owDaic65f7x8iF5brIs6wOnMYof5zIzz6qwRtf6/GDQAacLdJ7TkWToJMZRtZ4bbzzeJKSDnQpQEz2wlLZC76Z3ro+fxulrPy4hootFQG7F2oElC6SjQ0FDRnhg4smxfK0Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754418237; c=relaxed/simple;
	bh=oruEYX3tvqaUEkJIjHF/QVJlbp6PMmy7Wl4cm3XQ+bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ItblSTsy6W92mMkkAbW3Pq4UhVw2Ut1jb7EBgePhAxtKNxbPg/PWbFjt9Z9hIvOHaFz04tSZiUgNk3VMf7OEY6LHq/nEdprVEziqhP8eItQia3tIq9/YkQteWUqC3FANLknORzN6z9RatXCbNH4LfP1rGYIjKVVELXUebChX3+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dYKmTW0h; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CRlAgaET reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I1xdS032523;
	Tue, 5 Aug 2025 18:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QNvJaT+wQgFsh5Ainf+B32NhGhB+I49vBkqzu3iGKcQ=; b=
	dYKmTW0hY49l2oORaNowABN1E6XzDZ8ARxj4lrUT56HFmt14ADJ0trHTjMzPqc9U
	CpX43OD/4vDis6EAy1tgyLynQX0WM8optxRjo2EKZ1iJN6CVHo7aHvYmSikcxOEV
	IwFL54Iy66eP2rfVrqBcFvxALqa24+3y5C/hLTXRFzMv7vW9KyT8JTP3gvswpVEM
	vrxSK6a7dkhaUDBcHCIB3HKVUVXMlo/hMlsYkOqtOi19sFBsFCkqSnbInh5PjYGa
	hCKCip/1/8wHPn5SZ1DtRbwKHWV7g67J0vP3vlo29GDRzuXV3k4tSGKbrpUfLeoB
	zQfp5JSrXRNjkDr+9pievw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvjr1dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:23:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4GOc019942;
	Tue, 5 Aug 2025 18:23:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwq0pch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOVgS1zlXa8CVh+kUJ0zCi0FTEFOJpUQWiw9iBJ8OVP9tuQksSUKxoJ4bsRNpxhCFdD4RDHUwGAtr5cducUZ/e11PRAp0/Aj9b6cWI+BYAaOrMxxKBmpJYYdcSKhVLK1V3DQWCB3eMkdFdmej+uI+LC9be6jfT6O7MPMfX5Tdh/oS302eNynmc16Z9KAjHXRxc9zgv95BGO/viYJl7rUtNiJSYu1T6Z4ZAtQl0rtsoHuKC+1BASpf0oYK4TrqG3EAKGbO4mM42VGtzrmyexRX21GnopKfZRwLW5RIERkDiK06pZ6Xp1agvqbNwuwHGIaLuKfSqB2aga2msYwVXhGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3znBL5MqG7YjQ392gO73mTfdJlNLp5uiafw/02u6/8=;
 b=IvnkoU5J1Baf3uWUiHXWHrKEXUHNdW3waagtkdFDe/l/chVlYIgaJeF5d9m/yGopLYcJRzFoj4/ap/8e/L3d1kzdmI6sc5pljXzeHHPcXwBIw6OIV9GgvZ5jT3lH36SnJLD7T8V+YAshFAVayUrPz81r9YTQXYu00CpFhWUyo0kWcpFLHF3Ny0P6PXdUBoD6FdlPdQfMCYrm6rOKptY7ds9N/dYYTSBsO2cNghZjtHcwfGDd5s4lPgUotLrezwiW3vUkeGPIljS3HLmbNPdBc/LvHfAxHP+ha/PHlB9npAFHbdtZtDgYpEDsxUim24Vz5hYDkpALVrjWMPtgSBhuTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3znBL5MqG7YjQ392gO73mTfdJlNLp5uiafw/02u6/8=;
 b=CRlAgaETWEVqIGyRtzIrfvlKttncKvrU/XK7mvF5dVZOLmcGrR4B2y7XvkF4u5CS5IpbG1vzCK49lQZHf/cvhPlUoDVuw+AJnkY06Y1Ob/oGNBvu7aPnvJxMCK2TvIBftIC+a042Gl1Oedf6o/8a+N4Pv/47z5c0zQsz6XQc8SY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8168.namprd10.prod.outlook.com (2603:10b6:208:500::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:23:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:23:50 +0000
Date: Tue, 5 Aug 2025 19:23:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <c88ce921-2c56-43c8-9bdb-01fd4be19ca5@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
X-ClientProxiedBy: AS4P251CA0029.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fcb195-a586-4865-4e67-08ddd44d397d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?m87Nw7j0nr+U+nfbU9fCEcQhwDy42VzMel8pFy4XEmGsPxWhpCz2VKtzJW?=
 =?iso-8859-1?Q?pBwm5e5cmkx85/SfgQHLKuhh9Ames4tdGa7l+f8IFkosA+Fi43aD446Tje?=
 =?iso-8859-1?Q?fO0+VuJLN2vru6GataZSBEEsU0OxuKngPLKYmvW9HI65f2CQd4QIZSH6aq?=
 =?iso-8859-1?Q?2YX+fE/r/5vLd9rXToUbE6yGSTuQzI1XCtWBQGJnu695LaE3Pxj9docnbq?=
 =?iso-8859-1?Q?dDR1UrIx7rpeXWNrdVeQKhpESB/Ex9p4u0MLg2UOvmpdGaqHDDWzGHjscG?=
 =?iso-8859-1?Q?8EAojs+gcbHLPTFZriTxgfzw+giDYTzGWiKReyQ4hZS12hICq90BPsGjfJ?=
 =?iso-8859-1?Q?xx1wAgW+T5a6ISqT9AS+lvmljUJFUFhkG6CuaoDCDhRqaLq1m3xyjwITIU?=
 =?iso-8859-1?Q?ICS8TDPBB23xHcaYO04dNRu+acwyfBkdORieiQFp9bmzO4rw2Y4z9eZYfX?=
 =?iso-8859-1?Q?eorp7uceiUgBNSZlfZ8C2W9lVHfy9yFNzgAtPI9dP77b5nzKdzVpgqhmzo?=
 =?iso-8859-1?Q?HfVIpysA0Ys43JtwL8ARgdhLkOCcoQMn9PE4q7YoMuidiTde68hDo3UV4/?=
 =?iso-8859-1?Q?Cdup7qCy2MBY3nhLx+dfdj2iPaHPqU5k9CtS2xxllOGMDz0xIaBh/5T7Ty?=
 =?iso-8859-1?Q?uPwK9mipFWTKF6J9qXjCP2PEOuZXuLhkPuJPYpWwsMmyawOsTh86cMaW8c?=
 =?iso-8859-1?Q?gwyEYtZ38r7vpTyqvHPqsC5dMKGSjYwFA/EiuypA+YBmckzDmLsGGWPmPJ?=
 =?iso-8859-1?Q?9aX4PqeOZOUZLVJkqQ72zxlKMMbHebD9mOwq9/GC5FcPbBq3EGIMjhjTc+?=
 =?iso-8859-1?Q?SGhvEB3pEbablHWuPuVGifbm9X7CYQ5jIwAzU0sp6mrzDL6b9SP6mbt3A+?=
 =?iso-8859-1?Q?djRdp1lwD+s/WtrDzPOkISvFo/mLPM4EQMJ9rbLSPxIllT1qtY4UZ99nbg?=
 =?iso-8859-1?Q?nJQcUlqNGBhlMbeoCYOGxa9lcN/x+In/GSjb3pme7o2QkebuUd/FLL7I/l?=
 =?iso-8859-1?Q?U9Y2DmHldndA8MPHronOb+gBpFbGJjf4Mgq+6IjXL94JIbyIXdI7dBSc5I?=
 =?iso-8859-1?Q?IEOqo1o+p82kHHhiIMGcOPGY/VjFpL4PNa8pzwiGDnTy7jeZDOV2YdEtW3?=
 =?iso-8859-1?Q?wZCGYiv6TpQz+HWOfTh9v/ETs7kIANOd7ze3mfJ6xs8cSi8YjdGCnAo65i?=
 =?iso-8859-1?Q?YslCZiJJbcOqCC8BlJ2YjPe6uzrnL0PMoJ2c7gEH5Evg8Aum8RkiDJwLeE?=
 =?iso-8859-1?Q?zxJTv1Gp9h/N1yNNuVY6OilHzOODF9KRzkFBWROhvKnD56Timtf82vHcjE?=
 =?iso-8859-1?Q?wwfpmau3KyLqgmZ0zu8rG0SnrkZhP494pSf/ujfEqSH26LB1kUlak8y4sP?=
 =?iso-8859-1?Q?wwJVgZFf83TfEZbOFO6G40xx+V77lAzjY1ZoZK8wNEi5WDWlgyfqr4Lby6?=
 =?iso-8859-1?Q?4/7aRFwd44VgQpaz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?8xrLIrCJKBh7hNMCfOq7EGjru4vCtMJekjAygCmOEoFwI4ZT5aN7/QRD82?=
 =?iso-8859-1?Q?NNl06EiFvtQ+wYd3hfHmWUIGf2COi0/d4BdIrhtC0lWBvbn8xuFyh1Cnna?=
 =?iso-8859-1?Q?MuVH2fKls13PjWvygRIIq3wfCSIvET3OhGXjCGKLoaaYF53WwGHzFzwmuP?=
 =?iso-8859-1?Q?yyISJiDf9q3jFuk/wvvtT+2c4Wxdlneor8DiBFUM2NTNRRDq+geD5cqtvs?=
 =?iso-8859-1?Q?kirM/UFNaHTexl6UYHupdfFX2JPyURhJvVEMr+2SGKkNspr9B9XlAJKxpN?=
 =?iso-8859-1?Q?FehJq3hmvaEmU8ks8KkSKaIPXsSSPXKw1A1WrlFpc7Cs2bwd+Pa1RmlRUz?=
 =?iso-8859-1?Q?toEiccFI7GAaktrHykpm7yTjU+TmP9lEEpgTYvz706OLdSTb96+hNrjtJy?=
 =?iso-8859-1?Q?fVD1srd3Roi+Tl5JaxBo3XnYMjvaSKF374ySNIkLsG9QF0gKpcwAaURugy?=
 =?iso-8859-1?Q?uOeGYgSCXR28dwoBpUuZJ9oRTc7lS3c/wut2FSpbdGzgn1+1gcG7TRCiTr?=
 =?iso-8859-1?Q?v2NKJ8FSDBMvHZtUzoEQIc9ZnYk2fXg/ytX31MBPuTMFdF0Ww0G40fbsd1?=
 =?iso-8859-1?Q?TBrwOeK9ICYd3SfY7LVgD8oG62yjZPVlsvOUqMFb/7Gj6Xtv2Fcj7uPgRw?=
 =?iso-8859-1?Q?r4LrU6ADY7BGtym4YEmnnlcdWmzeklXIYz+fEvwWxesSZt3tOfM0HWYT4U?=
 =?iso-8859-1?Q?Uf5jYRdnLplRNA6hU5wh6iQX++gkPl1FAPjJDd0pIcbLUesGUm63Qb1GwI?=
 =?iso-8859-1?Q?JE24sQfNJ/jrBZPstplqVH9HciaGlvKOrbtQ2/rE3freADPtXsiOTVe2Rt?=
 =?iso-8859-1?Q?YiLD56iVT6syps7HXvsMoldcBzgU2TfXgtAG1HCETVPa3g7AtBbvqCMay4?=
 =?iso-8859-1?Q?TOZHW4IvypwccLBN4IgOdWYaylA8FlYtZZMpUrg3MLPjGQpfN1OrMIMTvO?=
 =?iso-8859-1?Q?iA/BR4ilRnnbWxmwmgYW0xbPGG5g8ZKK0+WaCUTQGGmDxCWXN+IWiQB0U5?=
 =?iso-8859-1?Q?mEt0JEac+wjFPPWl0S7Jxy6xm0cybOw4q1Ll8qYBj4u4a8lWCwoxpCUXzp?=
 =?iso-8859-1?Q?kj6Asa0n5eZR11nninKgXoudQaqS8hw7jHD5nSq/Aky+e8pMFKR+OnEtYD?=
 =?iso-8859-1?Q?w73pkgsNzN4AthbiA8GSFUlfYpqonNF9lB7+qKD1sNY7L2/piTh+R4+LOA?=
 =?iso-8859-1?Q?n3dOtJrZB6OTpufAAEAUIuqGv1ap00zbhCzPuBoaa7QsWSTgtkWyJo8Dke?=
 =?iso-8859-1?Q?s2dFY4YXqssMCmrToAWQC+/4l9Piq2ooj7o9mluQpSvU/BRG1fI/4rYxrq?=
 =?iso-8859-1?Q?5Y7/KLz5nWTqLmEONDu3VdcWlwT2Yo4R6ebykcfHda45lMRAUmBKb/yHSa?=
 =?iso-8859-1?Q?6Y3Fbn7O1wydMwzoPy1fqjwQS76zOyjw92sUIqCHlazSufSCOItGH014nG?=
 =?iso-8859-1?Q?QaHXBQSQfJTd7iqUwzyKQjMhCb8njvDE/CCYGtgLVI6SZOfPcDUG1JHWIX?=
 =?iso-8859-1?Q?Ktym1/vr7IdEL+sZWMCuM9Od2Sz+q0iuXiFAJO1/aEJ4mq7gMxijQc3uAq?=
 =?iso-8859-1?Q?8si8VMO5kGYTfOaF1+gX/oPAfpSYyPyn9xQbxHLJ7JmreOLygxzHrnS2zE?=
 =?iso-8859-1?Q?Evnvbrgd3TAfjUWzoHrsr/6BTt7BoP+KAfV6snzylfrtuSDutlV77xAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BNtRRL9SYK6puo6FdacMM5Z0/fRo/sUCNE6yy3z/iSKe2D+MyDKeMIhvr2TwquOMTK+pjFBxy8vhBQqmhx2NPsaBQi41rb5X8VqGGbINUanukddy1AVdqdm7d00Ehq/Krgfl1gsM6goPAS5p0CwIH2NuI9x1pRr21JcPUKuOCnp4n8sF4/AZssyKVsohYvvgFt5g++dPk5rBF/+3bugXJMbgsMbwKn/MacekXhiamcIQ6dfH0nQRt2QNVy5W4fRO/OfaIIBgn8wglQ8YyLzmg53U5dMs+cUHqaQN75MFurVtnKmPRecW0NlbIdOq8dpxMIBtaa2XXp6aOpZ1RCoVpLRWFuptqHkZDxt2CrZ4vACNXoq0k5Xadjsz1CAfx12MS/j1N/P44IxCKFV2VQwqdTF82W4wuyKU5H7Nar6zDR9Ig+ceqL6M5iOnM/pHH3Nvc5wSrHcLLTaRot0KXRvl3tH9Ihka+XD9hSOl7/gYSdQeixa45cUrpWKAPPSDOdUARmJ6NglwaxSEBPd2bAv+XHO5g4M3xw6dVU3rgG2vFA4g4rrVrOSRfjksiYeL6qH1/g2k6Zy1XomP9MoKfNrdyoowOcJltbRH2tXLPCVpklw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fcb195-a586-4865-4e67-08ddd44d397d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:23:50.0113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rpo6mfSM5TIdz2Q+rX9xVxKkSnfDKunXyv+Lxt4imXRzMweiHR6iFlV6g0iDXvFSIEKXk3gHBuBAbhQtEJWATZWN/RhQP7112JJ6D8TCfJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8168
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050129
X-Proofpoint-ORIG-GUID: _OoKjERSqw9s3NeZKhFwGkwfJkrl_pGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOSBTYWx0ZWRfX78Ks/2SuTxKZ
 5OKRQEU1ieu/tH9iet/bE0Xlk1JMKTgHSedYYmd5Cl+kcvOpjkKuAFwjoW5PWJ56725d+eswoQr
 He6i5P+8id2fqjCzimltj46O4A0hngbcRMqdw3E/5Zmkb1M8lX9SI32G0tdlgmaAjMCKobw5EYk
 yEn3i218PF3SzWqu+6g37sji85Y/JKGeWhP5o3besskX/SSqeKJBlhuY5uDAXDU1oyvWGp6dt9H
 e4MNSC2Cbr5tMmpbsyerts0QEKENkBzK2b1DkuUhUuUcp3pGgSbsv/tFy2IAfMApYH3epNJol+/
 wNoeH6LH+CBztlfzUbhfP+uMvC39sm6C2pwUgdLOyBg5PsvJseD8Yg8InljIG8DZsIc/OQHj94B
 C7dvhOMtiuzezyto6cm2VAV1PF8CDfc6/mo5P3THRq+O03F+zNvf99vgOwc68cmhtFpnxCNx
X-Authority-Analysis: v=2.4 cv=dobbC0g4 c=1 sm=1 tr=0 ts=68924c39 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8
 a=dQENeJEMAAAA:8 a=yMhMjlubAAAA:8 a=uubClPX8AAAA:8 a=aG5lWbR_LoqEFUjCF38A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=ZLUrnzr5YNwA:10 a=kfoj1ThlphoA:10
 a=zosCLfkllANJ8uAOTg2h:22 cc=ntf awl=host:12066
X-Proofpoint-GUID: _OoKjERSqw9s3NeZKhFwGkwfJkrl_pGj

+cc Steven

Apologies, I meant to +cc you here as I mention an issue you encountered,
and forgot of course :>)

Cheers, Lorenzo

On Tue, Aug 05, 2025 at 06:55:29PM +0100, Lorenzo Stoakes wrote:
> On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
> > On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:
> > > Unavoidably, LLMs are the hot topic in tech right now, and are here
> > > to stay.
> > >
> > > This poses unique problems:
> > >
> > > * Never before have people been able to generate as much content that
> > > may, on a surface reading, seem valid whilst in reality being quite
> > > the opposite.
> > >
> > > * Equally, LLM's can introduce very subtle mistakes that humans find
> > > difficult to pick up upon - humans implicitly assume that the classes
> > > of errors they will encounter are the kinds other humans would make -
> > > AI defeats that instinct.
> >
> > Do you have any examples of this?  I've found the opposite to be true:
>
> Sure - Steven encountered this in [1].
>
> As he says there:
>
> "If I had known, I would have examined the patch a little more thoroughly,
>  and would have discovered a very minor mistake in the patch."
>
> The algorithm is determining likely output based on statistics, and
> therefore density of input. Since in reality one can write infinite
> programs, it's mathematically inevitable that an LLM will have to 'infer'
> answers.
>
> That inference has no basis in dynamics, that is a model of reality that it
> can use to determine answers, rather it will, in essence, provide a random
> result.
>
> If there is a great deal of input (e.g. C programs), then that inference is
> likely to manifest in very subtle errors. See [2] for a thoughtful
> exploration from an AI expert on the topic of statistics vs. dynamics, and
> [3] for a broader exploration of the topic from the same author.
>
> [1]:https://lore.kernel.org/workflows/20250724194556.105803db@gandalf.local.home/
> [2]:https://blog.piekniewski.info/2016/11/01/statistics-and-dynamics/
> [3]:https://blog.piekniewski.info/2023/04/09/ai-reflections/
>
>
> > AI is capable of really big stupid mistakes when it hasn't seen enough
> > of the pattern, but I can't recall seeing it make something you'd
> > classify as a subtle mistake (I assume it could copy subtle mistakes
> > from wrong training data, so I'm not saying it can't, just that I
> > haven't seen any).
>
> It's not from incorrect training data, it's fundamental to how LLMs
> work.
>
> >
> > I think the big mistakes could possibly be avoided by asking people who
> > submit patches to also append the AI confidence score:
> >
> > https://learn.microsoft.com/en-us/azure/ai-services/document-intelligence/concept/accuracy-confidence?view=doc-intel-4.0.0
>
> That's interesting, though I don't know how reliable this might be.
>
> However it's for exactly this kind of input that I proposed the topic :)
>
> >
> > So we know how much similar training the model has seen before coming
> > to any conclusion about the value of the output.
> >
> > > * The kernel is uniquely sensitive to erroneous (especially subtly
> > > erroneous) code - even small errors can be highly consequential. We
> > > use a programming language that can almost be defined by its lack of
> > > any kind   of safety, and in some subsystems patches are simply taken
> > > if no obvious problems exist, making us rather vulnerable to this.
> >
> > I think that's really overlooking the fact that if properly trained (a
> > somewhat big *if* depending on the model) AI should be very good at
> > writing safe code in unsafe languages.  However it takes C specific
>
> I fundamentally disagree.
>
> The consequences of even extremely small mistakes can be very serious in C,
> as the language does little to nothing for you.
>
> No matter how much data it absorbs it cannot span the entire space of all
> possible programs or even anywhere close.
>
> I mean again, I apply the arguments above as to why I feel this is
> _fundamental_ to the approach.
>
> Kernel code is also very specific and has characteristics that render it
> different from userland. We must consider a great many more things that
> would be handled for us were we userland - interrupts, the context we are
> in, locks of all varieties, etc. etc.
>
> While there's a lot of kernel code (~10's of millions of line), for an LLM
> that is very small, and we simply cannot generate more.
>
> Yes it can eat up all the C it can, but that isn't quite the same.
>
> > training to do this, so any LLM that's absorbed a load of rust, python
> > and javascript from the internet will be correspondingly bad at writing
> > safe C code.  Hence the origin of the LLM and its training corpus would
> > be a key factor in deciding to trust it.
> >
> > > * On the other hand, there are use cases which are useful - test
> > > data/code generation, summarisation, smart auto-complete - so it'd
> > > perhaps be foolish to entirely dismiss AI.
> >
> > Patch backporting is another such nice use.
>
> As long as carefully checked :)
>
> >
> > > A very important non-technical point we must consider is that, the
> > > second we even appear to be open to AI submission of _any_ kind, the
> > > press will inevitably report on it gleefully, likely with
> > > oversimplified headlines like 'Linux accepts AI patches'.
> >
> > Oh, I think simply accepting AI patches is old news:
> >
> > https://www.cnbc.com/2025/04/29/satya-nadella-says-as-much-as-30percent-of-microsoft-code-is-written-by-ai.html
>
> That doesn't pertain to the kernel specifically.
>
> Of course code being written by AI is old news, but there's no doubt that
> tech publications would JUMP on anything even suggesting we are open in
> some broad way to AI submissions.
>
> Given Linus's rather neutral public position on AI, it'd certainly mark
> what _would be perceived_, in my view, as a sea change on this.
>
> >
> > > The moment that happens, we are likely to see a significant uptick in
> > > AI submissions whether we like it or not.
> > >
> > > I propose that we establish the broad rules as they pertain to the
> > > kernel, and would like to bring the discussion to the Maintainer's
> > > Summit so we can determine what those should be.
> > >
> > > It's important to get a sense of how maintainers feel about this -
> > > whether what is proposed is opt-in or opt-out - and how we actually
> > > implement this.
> > >
> > > There has been discussion on-list about this (see [0]), with many
> > > suggestions made including a 'traffic light' system per-subsystem,
> > > however many open questions remain - the devil is in the details.
> > >
> > > [0]:
> > > https://lore.kernel.org/all/20250727195802.2222764-1-sashal@kernel.or
> > > g/
> >
> > We're already getting AI generated bug reports from what I can tell.
> > It would be really helpful to see the AI confidence score for them as
> > well.
>
> That is definitely an interesting additional data point that could
> potentially be helpful here! I wasn't aware of this so thanks for that :)
>
> >
> > Regards,
> >
> > James
> >
> >
>
> Cheers, Lorenzo

