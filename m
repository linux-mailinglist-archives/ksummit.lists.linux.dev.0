Return-Path: <ksummit+bounces-2072-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD025B1BA81
	for <lists@lfdr.de>; Tue,  5 Aug 2025 20:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06929171D8F
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8D929A32D;
	Tue,  5 Aug 2025 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rkPJWIJG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ntVTas0L"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F12E36F6
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754420118; cv=fail; b=p12ga1wLrtACY14EcLh8sSyorQP2XMe5hItH3f/nBYnRfQKJv7nbmQL3yx8a30tLtrd/PWvFUY4B0uDtQQgIa4hYPtylo5IWpEkcxNQD1fa6C2xpHxb99zg/komLL9crtFW720lYGMG5w57H5NPmmg0Un3r37LxvUuN6gBMa42E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754420118; c=relaxed/simple;
	bh=A+FriUm9tSPWI/HJ5tY0lopx7UJRX5o9lJp5fSpeke0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RINgyDohAc69UWTwKRXD34LQpPhvNgqktivPLGOjstL19wuCgpAxTyjexlR3PoyYTcPZCq9T1aABoVcdC1QA016O0L6iY62zI0PUWHJBmFUT/GZMZn1Xy9Du8WVoTZ6mXt0G30AXQ0oYp4LQZnNCi2OtkhNUX02+8hWSlpMP1i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rkPJWIJG; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ntVTas0L reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575Ig6Ku032632;
	Tue, 5 Aug 2025 18:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+vlhyM3nbxe3RjtjgucW0WJca71T7JJQDNhg0Vo1XY8=; b=
	rkPJWIJGTIR0eZ+yc3kBLvUPZhEzHejsm/Sm+0O3zMW4jwctrtMF0iT2Oogj1gLy
	IRumTOeZq4ur8mvSponlA62mfmuJDSbS+Ybiq3uio+Oc5XKvumTAfWh2UNKnHqh4
	A0fnkT+nrLAJzLzWia5KMzAUsO4pYm8hylZIf67Nju/FMUjRaNew20OpMakdxwrp
	2kHKWvi3LRbMWujQibYLYmLU6pdSRwoNxhsVVhjcwxaLoilQ7AMJbKNRfQYe5TGa
	0uepqjt67NpGQUazlft+kRkJ1sHSciqvUNzNrwgB8g/spghELEr314nkgGIse0Oy
	DIeZcj8hkTSxYWN5tzhBEA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd031d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:55:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4AVp005495;
	Tue, 5 Aug 2025 18:55:10 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk9t4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 18:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR8kQ4d3sFlsM2IdB5q376isbzmpH0XMDLsEJ6rg8cm1/6oYqsTB6I9MAB8RkmklvT7z7B+rAjuNCtrCB97xNbBSpbS1dP4EaskXOaU1eIr3LC5yRc+BwQUQLOleI3Hub7FXlb0DPm+b3EIL2p7mpRR2kvBAj2vL5T4dqKWdFzcaHQQ1/f3Lqd03SC2AwHul+z3IK+0+/dmUTrYBEE8xfNkHriMRO+bKqyVn83uCI2eUcIjFJqgrNliTRC3fUlXBbY8q2ok6ZtyUKzVw+5fW/nqhpNw+gNsoKwF5G2nb1Kon1onuH6uKZAXybZ9bqLqukNA8Lfe9n4xAkAwzug6pyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbcTi5bpW7p3cA3LfbGskcZOvLZAoNCxbF75BtN6XqE=;
 b=EQKvN6HA8yztcIQeRDo/RK4+1sws+/XLAR7zq5iJ/2VAYjaqHMzF7mUJaPeXHjEHIbdF88KHVFS4nJWr8Vd9/fzHHt21qZBkdHJl6yQs/ONqsCbUnygRWtdB6pDaa+TNSVWxZcUff8R7zvq7Wdk9SyoL6EaOadxLkYdyMP34+h7UAcrI9disqirk7LhHyqx7UUO66SO5Sl2lrxuok04TW90RaQSjy+JvGPWTks0Hsf6/PVH6bgIdha/yOICtX+G7KCklpbkIBlqLaeyVI1T/rleD2F/pvHPZ4rgUnwDQmZSK/vBkS8iWolj/jG5Ns0gEhxFUd53moqc9doMhHFRGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbcTi5bpW7p3cA3LfbGskcZOvLZAoNCxbF75BtN6XqE=;
 b=ntVTas0L73Ni7v88k0I8Suu28MxOYWh7UK3jrqXcw6LryqavdKYJa+KpJH5jchAD8UNdpLno9iW9l56s4M+8lAnwrv8mlUItHagF8Jly/YxxFZ4swNlMFb3NN0xIfmDwtO0N83AtjuSqheptFTge16f9Ep70QkKk1weZVnZG3kY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4656.namprd10.prod.outlook.com (2603:10b6:a03:2d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:55:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:55:08 +0000
Date: Tue, 5 Aug 2025 19:55:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <13490467-2556-47cc-93d1-f54fe88ad06d@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <2da83ff9881bef84a742c06e502c91178a78a8a3.camel@HansenPartnership.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2da83ff9881bef84a742c06e502c91178a78a8a3.camel@HansenPartnership.com>
X-ClientProxiedBy: AS4P190CA0036.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d124f3-7dee-4ade-e655-08ddd45198db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?bojfeZmzfi0RLZdjAbzHs1xTRET83X0sMpmnJvL1PvG6+ACsmuVG7ldCKs?=
 =?iso-8859-1?Q?TDoiZbdsoBNvZXWTRlo4AqAiKO0WgTFEO9DGBA5J0PMaBFJK1OwygmEf3f?=
 =?iso-8859-1?Q?5SqY6QZfwpRI0iWBDXB3lZVoLpIilsLaaTw0fc1iKVqCD3uzhoAEwzgwIm?=
 =?iso-8859-1?Q?EgfJRnyhmEdBOef9dKmsOV8v2++lumQldHUMXQ4utbl0AVkyeZeWvw9Inc?=
 =?iso-8859-1?Q?l0LRgHgbJaZO9B0xnRpdsPcUvNG4g7NM+OxVZd6T8M87xCaTOiorQTXodv?=
 =?iso-8859-1?Q?NRi3acW+o7ZpFaP2ScerPhs8wqvwsszn5OD6GEwoMXLc59cNrprYW7PCnN?=
 =?iso-8859-1?Q?xpxTY1rtWCTP7ljf2mRiQDg20sSyUBhIMrmwQVWLKLSnyq0n+3hQL8153J?=
 =?iso-8859-1?Q?wWDuGSEZyXJE+t/bI4EtPJg54JssOpmmUEggKgUQm09dGsFGiGAjHlANu0?=
 =?iso-8859-1?Q?nmYPFGu2bEkOS3+Xb9WA8BSZvvK0napBPOpCxPHeiIm4JSGOCKzZ/TMK1t?=
 =?iso-8859-1?Q?7Wu2zL6vqsn9EfpsCiZeOPAdAlcOs/8BDQD5oJXT334ekNxDcdCz2blx8D?=
 =?iso-8859-1?Q?1rB5TeiTEqcbmsuqRHp3YJvBATVua2s8Ga3pFe+GPBmY+f77seN0Lq3Hgm?=
 =?iso-8859-1?Q?G4PfT2ir3xJotXLzupABL12f/1epp4xiFw6CF4tOjCrbwCMCK7VaaO67eC?=
 =?iso-8859-1?Q?1DK3N/uSvZEVwpB/ILrFNL3V4W+j68o0r83fpQMnCdkXG9oTha6l3cHPTA?=
 =?iso-8859-1?Q?GNnhc1/Y10wOpuboqdjRSN9JMoZCKUuarRV8HFejvRWFpE2PW+7BE0f6hc?=
 =?iso-8859-1?Q?44vEEPdYJNI5KxVYvXlFMucZ1xEsj56inXOQtbpkxeNNH/LLQyRYuNvvfK?=
 =?iso-8859-1?Q?uk+1Hoqluroh1K9RIPEys8QDU20AAYPmclkHXimLzGFXmh8l/7CY2jqK23?=
 =?iso-8859-1?Q?BCHV5PBUYLl/6nPsY6sFWTJO0QN1kbRdKBEGabCQMS/pepoPClkd+1iNDu?=
 =?iso-8859-1?Q?6GIzTRmxkM7H35/CQjJFsKtL5VaSt6tGhC3LnnpboJ2ErnZKd7DkD1jieG?=
 =?iso-8859-1?Q?Pozy5tTBrQ5Y4Pbw8+CDUtVNMvcEjxAqgXqYP90Bcf3242Jv2N0aaUgQ2m?=
 =?iso-8859-1?Q?0DX8LJ22t2o09n7jjaHLhZy1cA6rEMBpWXlycaujEHxwCAkLMitXLlTA+O?=
 =?iso-8859-1?Q?wmasQI5ojARGPKFo0O90dwy3ff2AU7wJ51ihJ5XUGrD9ShSXMt0PBtK59B?=
 =?iso-8859-1?Q?msN2MD+5OABG18l8crv24ppNRK+xwSbZrBXEb343beEmjiIocpKCMkCimf?=
 =?iso-8859-1?Q?hzV39Ns5T+sbBY2X7R2uQ2kk60azutNPfmpHQE4K0a9cBYogmB0BWm7Jgo?=
 =?iso-8859-1?Q?APpxQDUQw37DD6IpAy40/SMzGAxqwjaUUy1nsf08KWGeF/5dRILbc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?es6EKuT73zjjZI+1oSWVujcgW6GAWLMYEL3impCksfYxLRKtokK9GHjZf3?=
 =?iso-8859-1?Q?248dhhDFqTuIokoY4HwNCvA8VCxJvak9MLsWevBL6p23/trcCKqWsmplB7?=
 =?iso-8859-1?Q?eSNmiRCVmHZjXQR9crnz4hsx5louvWcbpJPkczQuMr8bcPYmLPIngpd+wO?=
 =?iso-8859-1?Q?gDNF/Yd3nnEHrMOspxBXudvYGNC5Lh3+p/UYfR/TR+JTSeQ5S2WOvdHVX7?=
 =?iso-8859-1?Q?bge7NdC/M+meIGMcqgR/8a6OBlwmlqdLMFjZ+G1CpP6XxX4QRNoOWIvuFT?=
 =?iso-8859-1?Q?EJ5VeyCF2yl3bted4ohnrDxIaZR3Jc0vA7469sbb4eEkljZ4+A4yCPRfA7?=
 =?iso-8859-1?Q?k874jidujKIRLQ8cBLeqfoNQ4bMXxiPPqi5n6Xe98Rz32TcAZR+7ghHpRC?=
 =?iso-8859-1?Q?55BjA6RU5aIjPKWSyMi58SGpZKUYP6FEGBT4OOxLQoJpFio7z0gylUmAYk?=
 =?iso-8859-1?Q?IRCNJlbN3gUPVO/t90EEZ8olTuapZ04j3FIzLZojpW25Tjvi0ZjSBevGTT?=
 =?iso-8859-1?Q?baTHPdXqEjwBD4C30b+cv1WHZt5StWAye4BuTKan9EpcINjwwndb5cQcbk?=
 =?iso-8859-1?Q?4MIBcRJetEE73i/Ca3PqpoehEYLEu5HlvK1XYR/vK9Mjy0/X+/U7LOsNeS?=
 =?iso-8859-1?Q?PwOXVjrFZvgda7NmHUXPO3xeFJY9nfXkUNhKkVGmp0JiVxyhFBwc5kbB7Q?=
 =?iso-8859-1?Q?9ehd8Qrfm2beBd/pX+PdkrPt6GcJY5srYFfaXFPoUHZasg8xRkLL611kDO?=
 =?iso-8859-1?Q?tkgRhs0JLs8AWFjm02aOtqpzPo9O/BykUKsg8c7RLyDjjaT2CS395xrgTp?=
 =?iso-8859-1?Q?gGnMyO/DV0JB/Q2k+6Myv7BaKWciiUb2RITZdWu960GXvKJpMgdYLmHqi5?=
 =?iso-8859-1?Q?XMvGMfM81lBxfey0lED0a3VugoonNdERnSK9FNPAIuLe0E/gs1Ifb7eUpR?=
 =?iso-8859-1?Q?EVSFhbYmYhSvVFoMtU7l+wQCkyVOEpZjNFST67vp9G3/RA2j1gTPXQ+t99?=
 =?iso-8859-1?Q?J3vy0xapPoMLARjY/eMdtDK66pvFxvSwYZB/wnXOZDW9QsM5Uga+NnyyVx?=
 =?iso-8859-1?Q?blo81kBIBJP5fRQT3zfwk6KiHE9j6C0H0MsrXA9kfF5dbBrJTB5HgqvS20?=
 =?iso-8859-1?Q?VFtTYEVy0xoa4yc93R5BddJ0CXawmMW2snz2NsFYxFEyQNLpGaIUcVj61k?=
 =?iso-8859-1?Q?Z7UGVCDMCgqBAfoBVHIieu3+6fTPqWbsP6RWG3rikygX2LyymfAicOQv5C?=
 =?iso-8859-1?Q?PfDiNja2wDnlgXjHsE4zEbO4n93pgHRnzNLHh7HZk2E62F6NlQtMEGNe4J?=
 =?iso-8859-1?Q?gsKYa1Nz/HBRcmaAb9znHHQ01etY6VbkJWev8h75tN15EtIpazimo/dLCr?=
 =?iso-8859-1?Q?WBmyEnACISg8/JJrnklpdEjskSavkK1FSYbRNo+j/0jcx91nqNbTfM0AJq?=
 =?iso-8859-1?Q?RCgG+u0nEavHLy33mgFwIVyY/t5ZD1bXAvVkPSJSPFvE/t9QoEiHzTmYFx?=
 =?iso-8859-1?Q?HWPbC3mNUQptCm5SqFK5soDPIDVpsFt1B1ydKVyHjZ0Fzi9E50r1Df5s+0?=
 =?iso-8859-1?Q?NEW+m8oiu9haAtjCUCNpAcpeRQy0+u9Uz7eer45Wg8SyWy2kC4fcma7Med?=
 =?iso-8859-1?Q?4Zdx1d46kVg1F/Ore70JEaeunaJjbp5+S7t86N/1FCCmz4bQxsto+qBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ffmVBJUDL+V5XXKdwDN6QgeCgXJAieRFJf/orSmAEuUo8z1sx96IxY/4WyMfjY9su+VyzAT6NilCCxzSJEJt8yuYYxUtPUamnPf3uZ5HSXMXqKv/5Y3shRxeXNM+gfH2rSTZ0fujki1kr+sJq8QPMmNMNBa07GTSWoau2fH2PpvJzly6dfSbePSVDexFxj4ASv2oeSBWNSvQEGO0/f65g0bmm90SE9FVAoJpakCYo+ByhGcFIrUjixF7MLONaeLtUl8A2M+oAxrBJweiKOfn/0zsoR0N4cS+zYsLIQX1rNbxZsLm0ny0BH8LV0Is5pyei9VlHtdTkKUMqO9ME9CVmcaXNkUl71q4C97Gqj3odiq0bhaum4Cg4r1UJZc6ji1Q097ZJj0njIdU0lbDSBJD0JbwbJ90RhtLN5iAQ6BhoeOiHqoHUbjdnMpA6d7yLq+C04pUKD0C03VLc4qF3JxRMCOYYgkIQBSVHkLZOQs6RpDCM5A6qZYHlu3tly5HncIfjY/cmuDAvPZBAVk3V0AJ/1HxKICj6vZ7Yhv8VyH1H5YS1IiIcxdBJnUJSyh7M3bQoPpj3EhZ6fn8L0aHuCq+/atu+ivWEUfne4JJVLakcXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d124f3-7dee-4ade-e655-08ddd45198db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:55:07.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30zMVkv3qEsgcJAfcJi4EZcLuA31WD3UNnxGPdbuweGbJESfcIEQD4eIToAPfAv1RlW4bW6rtQKb6Vv2axFs7qdgMl6KOrf3NBHCPE13F9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050133
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=6892538f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=oSr7OBjbAAAA:8
 a=VwQbUJbxAAAA:8 a=dQENeJEMAAAA:8 a=RadIMDVeuPXElmWxxvMA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zosCLfkllANJ8uAOTg2h:22
X-Proofpoint-ORIG-GUID: 8_vXoUKFpuions1i0mxVUQ8y7YeOqmwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMyBTYWx0ZWRfX+4jQwhk59NrU
 OBdq4avH/c5HNTaNak7hmYdPsyfJzX1MUmvlj22XYwAOrJMJ3ppadprYb0MIcdrROs//tnRiGUj
 q8Y03/Jg7UdxFHHxzsZEk8ef0Ob2ytbLMmf4VR7QA3NPsCX09Us1RjU5H8hHjWH9ofW2XwTUT8Y
 tYmEqgjgd6p+hrl4hPcnCA+xJKDCNGyMoV30F2/FQ96PS3IOrQ96duprp+9d5wI1bsobfi/D8is
 2500mhaM98KXIS2QdGLUB6Jv0KxDfLB2jk9ms76aVHrqhxB+ZyIxWqupCVPsCqPP32/JDxE67ZB
 efyOJ9FlWE2rQXIXsZ8Q4XBSWeFxx7FwvrGyvFuPtP8u/z99qf4WJISbnyFqWVAvmCNo86pBubk
 p3Aoqf+O9HPh/aJKLbjrdXbGZbOS3frwerS0pz/7kc3J0ZerfqhXRnf1uwOBPKaZ9MzYgeqh
X-Proofpoint-GUID: 8_vXoUKFpuions1i0mxVUQ8y7YeOqmwU

(remembering to +cc Steven this time)

On Tue, Aug 05, 2025 at 02:34:40PM -0400, James Bottomley wrote:
> On Tue, 2025-08-05 at 18:55 +0100, Lorenzo Stoakes wrote:
> > On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
> > > On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:
> > > > Unavoidably, LLMs are the hot topic in tech right now, and are
> > > > here to stay.
> > > >
> > > > This poses unique problems:
> > > >
> > > > * Never before have people been able to generate as much content
> > > > that may, on a surface reading, seem valid whilst in reality
> > > > being quite the opposite.
> > > >
> > > > * Equally, LLM's can introduce very subtle mistakes that humans
> > > > find difficult to pick up upon - humans implicitly assume that
> > > > the classes of errors they will encounter are the kinds other
> > > > humans would make - AI defeats that instinct.
> > >
> > > Do you have any examples of this?  I've found the opposite to be
> > > true:
> >
> > Sure - Steven encountered this in [1].
> >
> > As he says there:
> >
> > "If I had known, I would have examined the patch a little more
> > thoroughly,  and would have discovered a very minor mistake in the
> > patch."
>
> Heh, well now you make me look it seems that the minor mistake is
> adding at tail instead of head?  That seems to be because the hash list
> API doesn't have a head add ...
>
> I wouldn't really call that a subtle problem because the LLM would have
> picked up the head to tail conversion if we'd had an at head API for it
> to learn from.

You see, I feel like whatever example I provide would provoke a response
like this :)

I also encountered an LLM insisting that MAINTAINERS contained a section
that doesn't exist, but subtly incorrect. 'It' insisted that it was true
and I could check the file (it was wrong).

I've asked for explanations of concepts that it's got confidently,
misleadingly wrong.

https://rdel.substack.com/p/rdel-57-what-are-the-most-common

Is an article referencing common bugs generated by code-generating LLM
machinery.

In interacting with chat bots I've encountered _very confidently_ stated
stuff that is convincing, were you not to be expert enough to determine
otherwise.

I could go and try to gather a bunch of examples (hey, this is a proposal
right? If it were accepted then I'd be able to spend time firming stuff up
like this ;)

But I come back to the fundamental point that we are statistically
inferring information against an infinite number of possibilities. It is
simply mathematically inevitable there will be gaps, and errors can very
conceivably be subtle as well as glaring.

Either are problematic.

>
> > The algorithm is determining likely output based on statistics, and
> > therefore density of input. Since in reality one can write infinite
> > programs, it's mathematically inevitable that an LLM will have to
> > 'infer' answers.
> >
> > That inference has no basis in dynamics, that is a model of reality
> > that it can use to determine answers, rather it will, in essence,
> > provide a random result.
> >
> > If there is a great deal of input (e.g. C programs), then that
> > inference is
> > likely to manifest in very subtle errors. See [2] for a thoughtful
> > exploration from an AI expert on the topic of statistics vs.
> > dynamics, and [3] for a broader exploration of the topic from the
> > same author.
>
> Amazingly enough when you're trying to sell a new thing, you become
> very down on what you see as the old thing (bcachefs vs btrfs ...?)

Come on James, ;) I think this is rather an unfair dismissal of those
articles that are well-reasoned and thoughtful.

I think the discussion around statistical inference vs. dynamic modelling
is fairly profound and insightful.

Also that comparison... ;)

>
> >
> > [1]:
> > https://lore.kernel.org/workflows/20250724194556.105803db@gandalf.loc
> > al.home/
> > [2]:https://blog.piekniewski.info/2016/11/01/statistics-and-dynamics/
> > [3]:https://blog.piekniewski.info/2023/04/09/ai-reflections/
> >
> [...]
> > > > * The kernel is uniquely sensitive to erroneous (especially
> > > > subtly erroneous) code - even small errors can be highly
> > > > consequential. We use a programming language that can almost be
> > > > defined by its lack of any kind   of safety, and in some
> > > > subsystems patches are simply taken if no obvious problems exist,
> > > > making us rather vulnerable to this.
> > >
> > > I think that's really overlooking the fact that if properly trained
> > > (a somewhat big *if* depending on the model) AI should be very good
> > > at writing safe code in unsafe languages.  However it takes C
> > > specific
> >
> > I fundamentally disagree.
> >
> > The consequences of even extremely small mistakes can be very serious
> > in C, as the language does little to nothing for you.
> >
> > No matter how much data it absorbs it cannot span the entire space of
> > all possible programs or even anywhere close.
>
> Neither can a human and we get by on mostly pattern matching ourselves
> ...

This is a very typical counterargument made. The problem is that humans are
not able to generate these kinds of errors at this kind of scale in the
same way LLMs can*, and humans implicitly expect 'human-like' errors, that
we cannot assume will arise in this output.

We tend to have a fairly constrained set of errors that we make, which you
can usually reason about and really - maintainers pattern match on errors
made as much as patch writers pattern match on writing them.

Breaking these assumptions in unusual ways is likely to be problematic.

*Excepting certain coccinelle contributors of course...

>
> > I mean again, I apply the arguments above as to why I feel this is
> > _fundamental_ to the approach.
> >
> > Kernel code is also very specific and has characteristics that render
> > it different from userland. We must consider a great many more things
> > that would be handled for us were we userland - interrupts, the
> > context we are in, locks of all varieties, etc. etc.
> >
> > While there's a lot of kernel code (~10's of millions of line), for
> > an LLM that is very small, and we simply cannot generate more.
> >
> > Yes it can eat up all the C it can, but that isn't quite the same.
>
> You seem to be assuming training is simply dump the data corpus and let
> the model fend for itself.  It isn't it's a more painstaking process
> that finds the mistakes in the output and gets the model to improve
> itself ... it is more like human teaching.

No, I assume that statistical inference cannot be established for an
effectively infinite problem space, which I think in reasonable.

>
> I'm not saying current AI is perfect, but I am saying that most of the
> issues with current AI can be traced to training problems which can be
> corrected in the model if anyone cares enough to do it.  The useful
> signal is that in all badly trained models I've seen the AI confidence
> score is really low because of the multiple matches in different areas
> that proper training would separate.  THat's why I think AI confidence
> score should be the first thing we ask for.

Again, I've no issue with this confidence score as a data point, though we
do need to assess how reliable it is.

>
> Regards,
>
> James
>

I think we're diverging a little from the broader point being made here -
we need a clear policy on this - to details as to what kinds of problems
LLMs pose.

So whether we agree to disagree on some of these details, I feel we can
(probably? :) agree on the need for a coherent approach and a clear policy
on this.

And to be clear, I'm not opposing LLMs per se, I'm simply underlying the
kinds of issues we ought to be cautious of.

Ultimately I think we ought to let individual maintainers decide what they
will/won't accept (within reason).

Cheers, Lorenzo

