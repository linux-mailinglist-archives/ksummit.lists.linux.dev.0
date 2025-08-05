Return-Path: <ksummit+bounces-2040-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2BEB1B7E5
	for <lists@lfdr.de>; Tue,  5 Aug 2025 18:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9DC624158
	for <lists@lfdr.de>; Tue,  5 Aug 2025 16:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA52291C00;
	Tue,  5 Aug 2025 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FN5W82gS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vTRqTUYP"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB1229188C
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754409810; cv=fail; b=QdE9LAmH8A/GazMZmU/RYYIbNbK4iIXtTuRc9ietPpqFX4yZ5f+pJ3QEtGnytvRq6C7biWGPb0I1NosYLpJBI0PPzLc0/zRagxkDc1lBqd6iN/Ze3v5WUgrmMkRTDKrby5Lc0LmwxmRFysz40QswF+O7aJO82w87ZS0HRE2aQUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754409810; c=relaxed/simple;
	bh=oRmaSaIzWjsT5qWf244yUQcyVuAeVFV/z9h6j/vbKJU=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=dp6B4GhyVcjI/crCu6ead/kViqulFcN2BIXp94MxpZ5IcrFyteDts9r1jQHvK1pd9WheSAwZFG4pdI/khPWlzMp7eA7veEjhvKp8rtEz0Inn1G901qX8qZf5RtLdDNsGKqgz5JNdCs3ISlOlnsHvdY48Sa9y7hDNXdYaxgJdRc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FN5W82gS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vTRqTUYP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575G192k010203
	for <ksummit@lists.linux.dev>; Tue, 5 Aug 2025 16:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=JvDr/DaxpS0QfJTwNPcQ3kCln1ekwqyCwZfK9FiRv7w=; b=
	FN5W82gStjTes6mFV5vBGWq98u0gYuOUNKp/7Ia8OaMLAFVy6TQp9Uy07z6nhsqV
	p4fcFJsUzJtf6LAyBOWULIoaF/zHWA2c0qGwlWstnn1bNjdcga4iSZxFlwvvFltf
	AecQ8gC/IBG6ZyU1CikX84oAQgtVH6EQjbFrLAiSXWYQfpB7UWEeni1rvceBB6Pt
	+vP93wkCfOf6SZUPh9Nvva9v7MpmEei94rd+PpVeXSUDPZYKMGWRGuY0yz+rrMCS
	ZuKB3pgpVTzgfCSi5BwarWgBGJNrrWR/ct7IeMZavgKaYxyDZwoyGxl+77/oXSH8
	3RfGyiWasMT/R6yU8Y+TpA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4899f4w4k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 16:03:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575G318R022336
	for <ksummit@lists.linux.dev>; Tue, 5 Aug 2025 16:03:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48a7qe44u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 16:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJ6ojbXq/XqZOl+avu/B8gkRTs3PvVg8h/D2zDsWJEFgHr++1A+QdTJ3TAACLqUov22YgE7Yh4ybhdyDXb3sneQBlL8Ax1ZoRalN9EzLhy3UH0uTgP+/8lFJcChe3q0OIbfcfrrvOUi7E0TGNpBOKAPABKwDjOJMI+LcO2Z8AlCXan8zKxfZVNUGDNXRLL3520dH33Gr8/5MZUMnJiP1omavvS5ABZL2MV/rhE92L/6wPF938Ps7OWdjzR/4ypZikZzt84k1tsR+84LOr1pDJxbeyTHZefjIqBM1zUXsIHlLvBsaD0SORbMZl2/OKW9LPaDD5kZC7bUrqu+kYGOf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvDr/DaxpS0QfJTwNPcQ3kCln1ekwqyCwZfK9FiRv7w=;
 b=esb8ZyvOUzgbNuf4k0TrF75HrLft6wWYXpr+xlbRldh7FR3B1ezt1xLRiROprQuIpdlgjhazUlCoacwsc+W4qQlfptMZthNV8II28ipwJlt2ta4BoamXoWVEqQlJ3hsxEV8NXEZbj99bQAYw+ZHmn74EbQXiUaRF8ingXXYVfxTWjyPAMZs6nFf1/88q2JIWPpCpm6wAdIQcmkaTrNYqBHFubo1TcT9vqCOnYHLtKW16NUAs20f87Se61W1i2hZV3hpJsSXlFORGkWwOx3PAiucoJ0UtxEP6pfIV+tF2tcyolxCd9Ziyac4mWfNXmaNu65ACcyOekmk9Tk6IOMXXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvDr/DaxpS0QfJTwNPcQ3kCln1ekwqyCwZfK9FiRv7w=;
 b=vTRqTUYPktYWpg481EDmles2tj3uBsjRf4q6VZBPzXxS4OEfDYvy2AojTlcC5AZw6u5g7BIfCIRl10XDQNuOxTT++O4o/UyOIKjwYBxRn0mp7ovQJY/SeHx4v321XLNZRWh74s0W39k8CpLKeshi6OSex0pmgq7SRKbDmNOt3W4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5779.namprd10.prod.outlook.com (2603:10b6:510:146::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 16:03:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 16:03:22 +0000
Date: Tue, 5 Aug 2025 17:03:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel process
Message-ID: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MM0P280CA0109.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::7)
 To DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bd3958-5eb4-49de-67d6-08ddd4399a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3DwEvdB66x9jqeGFFgHDoPNlxR9XTD+VE4PgvXTSvpG5+FUH8extUG5kgt+j?=
 =?us-ascii?Q?ouI270zTbcpF74DByjW9tNpC9B9p3azDCuvutS0YpfGn27mNzUrm/2G0gmCu?=
 =?us-ascii?Q?9iXGJZ4trZuiuSit9mnrMLP4B/7rs3WPdvc1gQCI7e1cttUvsBX1OeKbCdHF?=
 =?us-ascii?Q?fMmFsFUQJMBERuZ5ZEneOsu79eIXE+TyLxa/EADulEgZvBPuAFno1pochuCj?=
 =?us-ascii?Q?Bt7agvvk9Sy5acJZLKgQW+lWOkjGQrOaGcva24mI2nmk8oITW5uRPqvxQyY3?=
 =?us-ascii?Q?LiEjmzKMzHu3iMlm3FcpM0sJXklSVgUNVQtlRPNI+0qpNdEmjMrJnx5noYQj?=
 =?us-ascii?Q?dnwCNbOs70kmWbyCD7yxrT05McH81CmPPggt1P3nOgB7BqOQM0djeUbXVs3I?=
 =?us-ascii?Q?UkYmCRvLi2y90Vv5P0l1WT0Wh1R1RG8DdCwo+kU/u/HpoZYWa8ULbxW5DD9V?=
 =?us-ascii?Q?4uZQDwhQ01Dvf1XGS7629MWellrgqc0nKbAKpkD4kkxIuAVEMZHobXusEDkA?=
 =?us-ascii?Q?Zj+oyLz0+Y1IwgH1VCwD9Vw9muzESYoJi2deijvgUz68tlLTq2nm+LhUdibP?=
 =?us-ascii?Q?QyFjvyRCF6y3cStz5zAmPV+9J8ZxIGiKNCW1CVeoInEH/HCBS4yYIJIu5O4t?=
 =?us-ascii?Q?7C4LdS8oq0TlzXkYVk8nckM0GHLn4RT/PhJTv9qbbX/wILMDP8tNGQL/Ugp1?=
 =?us-ascii?Q?iKIMRCsNPUbyQ79V6AN00n9J2+9XUX3yF/xLHRaMy3utFiE77RPuNJ7+88nl?=
 =?us-ascii?Q?Gw5Pl5Jpfh1M2PRGX81811Vf7YxsPgLgNDdMzgVqCrnf4srm2dEvLhMxRdNu?=
 =?us-ascii?Q?Dc853yYogsaoePZF3P9L1l531inV4fkzfqjU8ZdQJPN2bLVGJ2ta5bjqDXuX?=
 =?us-ascii?Q?hssqtWmqNWTAl6Le6WfaW1L/vibRb8dyDg8cBM7PR1Izw4d042vrRFEkEGlp?=
 =?us-ascii?Q?xx32m82dgAwV9nYmBGEJ6K4zSxAid1Z3+0bi+FdtdpnA85YzKis0PNSmzgu5?=
 =?us-ascii?Q?ap6SjfVrvRiSQOdXaZm5LVvob0/jJfwKCOquaQXNRPIgCfqTiCULkhElGZIT?=
 =?us-ascii?Q?dwsVj8u0pZ4RQuvF5ZY7GHvVRjhoSDlo9cyZRp1arM6uc3Drqgq1Vp+oCoyF?=
 =?us-ascii?Q?x7VYX4rlxlozwZ+uS8dW49Y/E2S+iXMl33NZ19QI0cfXRc4SBhBLi9Er0usp?=
 =?us-ascii?Q?unIWer3nKUSsxUvWvGiSPNXMbtLtnqhiBgAZ5DBSknqwSxPDDD0o+lYPgmPs?=
 =?us-ascii?Q?WmV2wNCwIjttyR+SLYhULMDwxEk0Cmt331VVO55dxwxDgcI/AbuBxtRHXhLg?=
 =?us-ascii?Q?Lq6imM+Dl63opDWNbFeeDwcO+IdbHmee8dfCz35a3FVc1JqV9KBqiGtiYS5a?=
 =?us-ascii?Q?rovOydHEteTl1wfoIoqx5e/1Usk46wZLmr//uNADpn5OlRBa8vP/taZ+M05V?=
 =?us-ascii?Q?pbpdTuH8Ocg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LNVMnv+ikC+HJjtXlZrFvnBw5MBFoNZwD79+92hyMEf4pm27ZhrPigVGbo7T?=
 =?us-ascii?Q?GZsfDbrsZQzHf13Tr+ifKTiTy30gsPg1W1lemYRzhNRyN2noBUMZxm+sAd2i?=
 =?us-ascii?Q?M31cg2oyevcNPvJl3n82Si6GAA4bBkb+eZ9sVO6MO8v56unbdCbnxZVHfB0l?=
 =?us-ascii?Q?IOJGwGAJmLhvUjTsAboFz0SZEy0oEv9V4V5u6jYh9IzBWnuQVr3G0CnLWxci?=
 =?us-ascii?Q?E4yKZvcED+5EE4kDJwLYIqflz6HEKp25qmicZIcpY4TKsrfWJP9oInT/o70N?=
 =?us-ascii?Q?4CYAEbboJ4P1cIEfPRnYk8Hu+E6u1494m0lgVSZTBPrDp+ZaD4RphCY3/+G9?=
 =?us-ascii?Q?JWtkCDFIgeMO8u30hLdGyoLgHbtlWKhSHEo2o8MR37p0vLmdwZf+x/U4R/Sz?=
 =?us-ascii?Q?vXVQEiQMzpPu/Ulxs3ZZuCi4RCSdB38cYHBnbQF0V03qcyV2t7znBS3Q3qnP?=
 =?us-ascii?Q?BqRmKdqTY0EHhG4C75Eigb9y3uKBVUvq6k2uwWObAEBOTwo67T3DI06GRhZH?=
 =?us-ascii?Q?9sWvv3Qdri1R1Ahs+h2x/nionWgfbQUerwzvptV8TangQSTNyZJX5/01oNek?=
 =?us-ascii?Q?79YisD59C0+2AzdD2b2IIQcElbMqgu9dvkzFmXUg9dMLZk5CiSbS+h3UWRBH?=
 =?us-ascii?Q?xoIo57TUSduGsvAqoUkU2uWc5kDBlKWjP5r+vanUSHMc9PbTZ2SS92kBuZ3c?=
 =?us-ascii?Q?Dl172vF8fqGFy6uvWm79osLQDKEJUABaCy5zm2NofdUV1MYpTcpslZXTMXBW?=
 =?us-ascii?Q?9iuRwElcP8/xAkPBo0GOrThnjl8QGIhNwMB+/gcG4zg7Hg8DQmymGrurMDCW?=
 =?us-ascii?Q?iaNrFnyuyOD8nqEYZEYHyTh/pEPVhcmqD/cikGzKLdGghOsVNdi8rmvkl1+5?=
 =?us-ascii?Q?xbiwZEzXlPa5yUNmzj+JA+tYxhBy0ZBqdduznJ2zJ4bbIWHUC2NSKiXlB2OX?=
 =?us-ascii?Q?Ik0iTMeXyothHPbQF7d7/jbYyi6GR78dDK0oDSdqcGGY21Re+Dko4UykTQLx?=
 =?us-ascii?Q?qs6i8YqBRoNN3qRRHSP4IrKs7vyA+FLqwKriCYyghgqyrdV5DrqxD+UhIBSm?=
 =?us-ascii?Q?dBmVvvkb81rCigSLVv3amO0pLlzsQfcdn169R25gKbv7axPYpuwXWfcjfKhZ?=
 =?us-ascii?Q?hHDVoyPbTEg9VjBYmyLWLRXUn9BQ/ARqm47t8A7AcuMsWbqzvPWWpUbs5hRE?=
 =?us-ascii?Q?7p12lD03mIPp4u8mBVXh3sjxwb9JvA0Izzyr1441p09Re5Hjt25+6XJEJH+c?=
 =?us-ascii?Q?lwXOASW+ujsq4IhS+FVDOxXZxGYgfJSMlEYsFE6Idz1fuRy1FluCnrxfKpwe?=
 =?us-ascii?Q?ZBJ2yXrIHGZPIMoH0Z8JeQutTEWHntVY7niZ/NDg7nX8mhJfROOj3ZZYzE9M?=
 =?us-ascii?Q?E8JirbIU3kfhUQ1xcNJ56EWlY360NwKJGPyQi6fNTyljFJjXGQrpFkB0GU2n?=
 =?us-ascii?Q?+y1bGnIeimnqZYZ6o9lHG1sScJCqZjMNpBHfD+yQSe6u4j4teZRBMAvfEUOk?=
 =?us-ascii?Q?KTR7uQy1ZmqcW7VuGk5SvLjxMu9/Lb+6GQ8X5yL6NsPy2ug/c8FB45zGTe4u?=
 =?us-ascii?Q?zhJbNKigU1XBpHI/TBd0vRt6WKIz5z+yHE/qyXIgrdJSMbMHSqu1g7MwVdWo?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NqECPAuxOacoI8gYfdT7+XJE1t7NALh6fDRNacxKrARU1F4yxoZJOu6SaS3FU8RswnyV0IGWGX9kkckwrP/0CCpT7aKEEIlIzVfqzwq0b1Zb9Y8zQZxtzoTit7Pp1Ny6mC5mwh7Lw/CjD8OCKT+vVP6uz6PMHSTRkPevFWNINbKsThK9IUnPo9crt5ph3DcQ///rVNses1/9UO4DhfMlCd5IFdX5OBRnpRbNhzbY/VjimSDAkXMlXICzXl7z1ekHXM9KkOjrKY1ObCqfRAYkV4LSY+xx0H+60OpFfe0aSRvbzZQovwcjyJi5eteV1RdWDuG7+AJTnR1J4G8FkGoEKWxawZrWZ4oG+yXjvYtTPDVkedcpcERKro4LZlMf1TDocuWhmEIepX4HVrcdZlX47kvpVJaHX54pNlbS+N+TziFlPxiNfrF4H6QPw4PuvkobPSReLj36AzMj+0yDGYrRYtBUQTNcNkEP9TDpjciSGrAjNYn3eOWQgW+V8tPhpZRWnvx+CABRuKVWp8aNjkrDcPPvEU5nAWJUr7swT1XWMvwuNcNYMXzh860WJa+Frzia0Btz05a0igH95+vvPMszRfC+8fCKYs3ob/HbeecNG80=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bd3958-5eb4-49de-67d6-08ddd4399a74
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 16:03:22.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqcFh8xptd9YMeYZjR3o6pQXHY2oSiX3z+A+IQGK+HZt976L9nlwQy//UwtrrM2QuACK2bL7yhT2HKwN8hHSpD/S6xIR8KgXlV0QDnew6GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=978 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508050113
X-Proofpoint-ORIG-GUID: Cm8FCuIgFk7fF1yF2Z2rz0ueNkvIrpOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExMyBTYWx0ZWRfXzt+Kt8bAvSO4
 WpCMH/6TqP1W+IaS1U9TnKqL272MXwJB5IQFw6J8lb8as/v3r7n53kmToTph06JzQ3Hlz2ADoKE
 q0rx4QyBSIedEAo8aoVXejpB7SXkmNTKxHd5HDFdbny7WYD0tOKEkEq4yX0C9LCEAJ0HR80bKy0
 nezXO0SLfr9/mA46k0Z+KmMJvznNwHx8oKvY//mxMOwVcl4OnJVd1ETlh2I44GctCgW40EECWwA
 agsvjgv9FHHX69g74Z7ndozb0wGI2Qcm+uVSCi6fxVXgDnHztkZz8x5TaTWrG27/bMaQbyRlj58
 LWmSdKcI+hDL4GAXPUEV3UYHFjKLYtlwZTFYXiB2Tm+7vZFWQhyJ9nCX/m7X9NCxn0fj/957m5O
 rBxg9AfRRo/w0fjXFfkoDe4nZSOd/xw1TbW9hfJfcSvJLcShKh+3O4y7eMPHgRibdwcPR0rS
X-Proofpoint-GUID: Cm8FCuIgFk7fF1yF2Z2rz0ueNkvIrpOR
X-Authority-Analysis: v=2.4 cv=daaA3WXe c=1 sm=1 tr=0 ts=68922b4e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8
 a=tD1EGMJvwgou8rrXPQgA:9 a=CjuIK1q_8ugA:10

Unavoidably, LLMs are the hot topic in tech right now, and are here to
stay.

This poses unique problems:

* Never before have people been able to generate as much content that may,
  on a surface reading, seem valid whilst in reality being quite the
  opposite.

* Equally, LLM's can introduce very subtle mistakes that humans find
  difficult to pick up upon - humans implicitly assume that the classes of
  errors they will encounter are the kinds other humans would make - AI
  defeats that instinct.

* The kernel is uniquely sensitive to erroneous (especially subtly
  erroneous) code - even small errors can be highly consequential. We use a
  programming language that can almost be defined by its lack of any kind
  of safety, and in some subsystems patches are simply taken if no obvious
  problems exist, making us rather vulnerable to this.

* On the other hand, there are use cases which are useful - test data/code
  generation, summarisation, smart auto-complete - so it'd perhaps be
  foolish to entirely dismiss AI.

A very important non-technical point we must consider is that, the second
we even appear to be open to AI submission of _any_ kind, the press will
inevitably report on it gleefully, likely with oversimplified headlines
like 'Linux accepts AI patches'.

The moment that happens, we are likely to see a significant uptick in AI
submissions whether we like it or not.

I propose that we establish the broad rules as they pertain to the kernel,
and would like to bring the discussion to the Maintainer's Summit so we can
determine what those should be.

It's important to get a sense of how maintainers feel about this - whether
what is proposed is opt-in or opt-out - and how we actually implement this.

There has been discussion on-list about this (see [0]), with many
suggestions made including a 'traffic light' system per-subsystem, however
many open questions remain - the devil is in the details.

[0]:https://lore.kernel.org/all/20250727195802.2222764-1-sashal@kernel.org/

