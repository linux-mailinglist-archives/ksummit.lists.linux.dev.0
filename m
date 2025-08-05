Return-Path: <ksummit+bounces-2056-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A25B1B9A8
	for <lists@lfdr.de>; Tue,  5 Aug 2025 19:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D4818A53CA
	for <lists@lfdr.de>; Tue,  5 Aug 2025 17:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5ED2980DB;
	Tue,  5 Aug 2025 17:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MUX4RpQR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ft5sEkbz"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770162957CD
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416540; cv=fail; b=O/6DQp7B0wQuEaFobEUUxw7Gxpneay/ELfIUks4QlCmC8WbSTBXK0YIk9dAk0COaUKIHWTeWxmVWi/EBkln9Mdf3hS4+c2z4nki/JSNfAaq1Iuy0CH6ScWsfDI+YFT6yfSNi//s1YYrB9gcpurDznWKpcfx3T9xAI2EHQdpyuLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416540; c=relaxed/simple;
	bh=As9SaHUA9PFShFG7Hki8LdnmjS1uLqlQgA1/JEw+g/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cX67nNxKgczBrUfe+cglQDCHP/16bFSRXRmuKcs6jGm5fPNU9bj4psNbiBRHLJw39Fq+Y36Hn//69xZGgMoto4i3lUN8RBB31HjK5cRuW2TURcWfLOteNfKFHQltdRSgA7TfIXkIRMtg7d9SrPD85nZAsbg3D3Cl9WogMv1biTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MUX4RpQR; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ft5sEkbz reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575G1DkA003353;
	Tue, 5 Aug 2025 17:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tynCxdqASUd+OdaBbhdetF2YW2P1XBnOfXIS5HxK8NA=; b=
	MUX4RpQRBYeJilhc0xGbtyJEqLMgOwSvmHLbgmJ/2JpWLrOFXmT3Op6+Jwlj0yIo
	NbUhgTWzgP5DPehRj1p0ZiwxaRQa0I0RoXWqLAgTacru2W1R8dfslTx4Rrugd550
	iNdnyACEVBy4p6VaKieNcUsdt9R7Qu0is+F+YXEG6pM3+1W1M529fDPMmpQqQoPx
	qe6LW3MTQGOGsBFKHsotkk5wOirq6TWYGqnxR0V4Tm+Mc0RnUjHutlWugJV3Mb3g
	jOvIsDfxEVCNKFKZ6vacMb9e/cJS+Cab6VpCxw6vHls9v97CbGahQX41UlyGiHBv
	sHgUlccDRY5Q08C2mxB3YQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48993fw9g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 17:55:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575HlkJm034967;
	Tue, 5 Aug 2025 17:55:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48a7jxhwut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 17:55:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaHNObi4ik2rB7bGTDag3gjJ7cfHvrSH3pOWGet8ccwnVpp+/aswoR1t5O74jWcUiEDwDeewEukJ3oiiwjFYXiKgQXDc+drTMnmSfRUNBrapzc+mm6197JJ3buzZRzfoBNaO63tlcgGfLYuLqjs0+yAxDGiYZsROlIvfYihGEH0Uu+8ZsW4b2ZEKJOM6SJ+QFFpyMXlMDTlxP3+oG96dwrTarE2TgkiVdKW9ItrRa3nx5BmaPNXkTjqaHbS0HGAcpFnAqV/9FmPsiUrVcU5kuMAz6cof/0lI9eXiBToLoUmRZlmbtT+mrFDR/PNs6Dn+HtK2ZLMxa/YdtQ+0fJSZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjozuAD91Ck1HVs6iCCFFQx5BucPPfKofaM2Iyxx33g=;
 b=d5pK7PLv7Hm2EeYiXj0TMtMUQ55XBIOCMwWH9Vw58b3eGt8sdG/bJbyfTJSJ7cRWEs7738oeGl8mg3VieBSybexss/FwUcB0rzTlufLxsmNE84xF7ZKcu+bb2Xm5MEa0J1iGmL9HZ+LW4vW0qP+bAkcu1YniWE0JM+zFwC4jzu8s0FlVaMBP10wPbk/4WdN30q4llFx0q90smC+DnBP954cvxn2BFTvAQoTjKMdOMnsU3H02f2URXmb8htopjZhqIvOZHHykt4I5k1fmmwFlW9Yag2JbiE4FjLm0iWcxm1RB6IgJJ6XePMX38sfme8WwcpX+TdDCG/1yKWPepn6D5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjozuAD91Ck1HVs6iCCFFQx5BucPPfKofaM2Iyxx33g=;
 b=Ft5sEkbzmTV0rMj+toCKsvkVrx4ua0vZpR9l1sBuRf5DdSY/5CnZzzm9D/rhg8wAfKSoUbgUV1Uh0ag2jDARgC3eLrOrO3Q20a6BOwheGja0iNIM4L5P3WCO002Tq02YNcsltf9r4JUcOhTlfa0kc4vqiaQDaXPoDlO4Y8cJuko=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8019.namprd10.prod.outlook.com (2603:10b6:208:513::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 17:55:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 17:55:31 +0000
Date: Tue, 5 Aug 2025 18:55:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
X-ClientProxiedBy: FR4P281CA0378.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c9e36b-d2c1-457c-0f9b-08ddd4494558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?cOQotQZH8+VzQodYdWMPXU80mqbdQQshNhQFj4kgrnC4jNaMQxZRKbn/ts?=
 =?iso-8859-1?Q?ySsl1N468JI3+w6aGWHcS1ksPGtw8HZnDSOHZ6aiXL6c2tGHNEA/xgLO0V?=
 =?iso-8859-1?Q?ZZKe0GTtiDDvD6DOfFTUjMaLv0tcJ8FxubiZjfTThu6vCYaAlZ8HD/ogZt?=
 =?iso-8859-1?Q?L/GnDW64p5Tb/n9j8uhnJ6b+ni2JP9LDWa/297Nyml0ufr/B6h3KoQ5Yt2?=
 =?iso-8859-1?Q?iWhwtE+w4QjlpeUjL5ena8vQCgmN9jWfxwPq7QANLgddh85Fx7Ez52Fn6D?=
 =?iso-8859-1?Q?Q62dQ4rm27sQvpjtRdMQo1e/cgiwanoNV8IRL6f9tNDdzFDNfJntfPHr3g?=
 =?iso-8859-1?Q?KwpaLJIAyuiXDMwyHdimrl+lUMsyTY8KoHw1RTLys5wyst+w/L+cxceFHc?=
 =?iso-8859-1?Q?sO5C1YSxMBA0f0goG50i/PZcjacXJRwNR6CY2v91RRCQsRDFMR3ZmMA0Jb?=
 =?iso-8859-1?Q?YU5IHH72nEBwgX4ZdnbKD1I30vJIN3sY0A7JugrazeuSq1/uSsOOixXZIP?=
 =?iso-8859-1?Q?ISNt5tVN8DZnlLiFcx2bB5/H1pu7FYabXmUl4v4ZuyxwB8YCcs0CFSoXP9?=
 =?iso-8859-1?Q?llTx5o6RaQkUFz8yHMiqfzF3hw7Wi5ktFoFyu6Zdo62fPKyy7fe5E9sDYb?=
 =?iso-8859-1?Q?LHK84T/HUe6+EyDnFd/KE/jLI+gIvmPAw2h9f2w8nNOXTClkADXDjWdlKk?=
 =?iso-8859-1?Q?kycbycGxMoqDyXYQD7jJ7GhG7/MorMMPpZa+3haUCc2p6e3v2SRFIw9JR4?=
 =?iso-8859-1?Q?i71FVO694+5vb7iz3rjVauO4UkQz0IVA6BeLvSex1wNMPrsci+W09rDjT1?=
 =?iso-8859-1?Q?FrHDDTKYx+CcbeJj5CpNlUfPpXaa9F+Epfr1unL047yAjINJNEjZq9XdSl?=
 =?iso-8859-1?Q?criSqNDCZXnPBoDy5sHHZTyLrZbsFP6BWL0XL5QfIlMrnQBl1FT2M8JIwj?=
 =?iso-8859-1?Q?BBOt4/FgBhtWJnT3fNP+8OxbG58E6JALnkmSxAUWeWum4AJ8Or4cqmyLcs?=
 =?iso-8859-1?Q?XJj+Cia6/kbgEOth549foEK3G9Pt4/7/8Odb/Nkidjs/hZtMtnVeQ3vvzF?=
 =?iso-8859-1?Q?epYPEBa95gzlgHKM3l7IE7i+SC7iXiYV93Qc9jP3QUu42m7sdi1l/tbLP4?=
 =?iso-8859-1?Q?+got07NbIFwLyeaLcoCdahxMzXPH0QlHeyfRo30GcWyStvuE65ZU3NrOky?=
 =?iso-8859-1?Q?h54yuOpKpVrgiCgWtj2GsqfV1PE11uLolEoZk8L6qW+QBnL0XZeCOa5g52?=
 =?iso-8859-1?Q?IvP2dZI/1zFZcjTDcmQvtKTxSA/tAOE2Ubf4vjVcSFKn++9/ifmLi6/a9V?=
 =?iso-8859-1?Q?vmFCHsIo+k3nbY6zbZvMFGha8WoojRnCPr7dUqq2halYPAjc0Gf+WnK1Nu?=
 =?iso-8859-1?Q?EU5+/6BS8qJlCc8FI+GmC5waequgnJKPI0WKJmZ56YGLm/4VheUU0Wd79k?=
 =?iso-8859-1?Q?GVGItNPS8jIacYf5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lWouT9X3Y5Cr8FCKXvAfmblvKrLRBM5nDZnQ5NTkdHOdhyKWKu0H5X8jRW?=
 =?iso-8859-1?Q?hLfx16RR488FUOVOq3iLoJ5hScE2ElmKoaOzc7wd81UJ+aH1pq2hI9ZL94?=
 =?iso-8859-1?Q?t2E9NsL5wDeOqkt9KiQQFLyWYK69KTFteXBVTh2ang+Zn8KBzbmPXDrR8T?=
 =?iso-8859-1?Q?H30fcYt3RXiMIaXoW9kGM/CUU8nIEEHXAVE1ZBu6DwOnlsX1cX9zTvo9AH?=
 =?iso-8859-1?Q?9e3rt95czDulGFiNyda0l5CLV8W2lKXz3+VZpBh4CX+jgDp9u0kTfnWFod?=
 =?iso-8859-1?Q?l11KEzxX6rghClkoCDpS1loNhZJijHCkEIjW9boyKWRPnOMpsfD80aq5Gj?=
 =?iso-8859-1?Q?8NiBcxoDpeo9oA19eaxRKU18l7DSJJK0yI6lyOGwHm8AQSJiF/tiliCyil?=
 =?iso-8859-1?Q?+pMD3G8QW+w0OgahKgK9IHBK98W++MERnKLM9nChTzHn8Ky84qmi5OAICW?=
 =?iso-8859-1?Q?Wviv6YKoGzlrhuA/oV43wcpn87XLD+2snEvKd5eFjTln9XQOdK0XdmFppQ?=
 =?iso-8859-1?Q?i0sANvkjxREkLqpfVGLNtw8TG0OyLRFFYe09RSRjbApzkfdm/dRMmniAEv?=
 =?iso-8859-1?Q?ByCZRa0GuO3XjlpqSy8kkTgGxWMdCQ6KransecXWTRxPqcCd9T4lm6vEbk?=
 =?iso-8859-1?Q?7wSMTdQgcIryn0l4JykXvi8SR9WXv0LNrbmY3BvFi9neSA2nHiAsV45xmF?=
 =?iso-8859-1?Q?O+i50xwM+oRZt4kRNw1FINAnbovBym7Y2c+PaRjhqmoB341KvFrKQ7ilK3?=
 =?iso-8859-1?Q?/MgPc28kVmqJ/W92Lsenj5j/e89rLqeCVFBPeyLoppwMfOjg8VTtjnI9pN?=
 =?iso-8859-1?Q?n23nw4ucyIq8dGzL9jVjpDUDVhKU+5rC9hNJg3OiwF1quY6pbTlXrgdXI9?=
 =?iso-8859-1?Q?KU45FtkVoZvZK5cWG2r5rM3FQUHD/1ffKHeH1BGql5PCCLNfPkJacIRbzr?=
 =?iso-8859-1?Q?t5QKDVmm5zU46Vzdn7znDXnJz23go67v+ObmxBj1NJ3GiscCbEuXpoisLr?=
 =?iso-8859-1?Q?Hh2JxRBQ5V91Qr9Uu5zT20YFwbXthEDRPDyzzGchlYU36ZAw+jfHsqGORJ?=
 =?iso-8859-1?Q?2VKwfgBWuNMYXE6sjlpba193gBE3e5aJweoxSd03VTkdyuKm9uO5zweF1R?=
 =?iso-8859-1?Q?ws3oPQnmo5dhS89vre+ebhfsyHM8m0C/Lt0CbujsEdQIRFhes9BTIsN8qV?=
 =?iso-8859-1?Q?ooOWl2M+R+4OH9a90m76dKhQqS2e/S/1TIg5zY8hWkV1P1PwK0YEk0qVwH?=
 =?iso-8859-1?Q?4BwZz8uPJFxiMwVDxSxUQYzWnRru4z5Rwg2fUQcuA/3MEGNyTviX0iu0X0?=
 =?iso-8859-1?Q?UIT/rphHiEsKVQqbT5NPik5j3l9NDriBqRzDBNgnE7WqNsxVcuYD6hjavF?=
 =?iso-8859-1?Q?u5aPILkN6kodTJqWnk+2f849PEK1E1+zSBRlzn+KrFBKliqgRHgiiiuu4h?=
 =?iso-8859-1?Q?AuVUdnT79KcR58VIPhsuTo9dvJPVK8F2U9FBM+l0Fhif3vTwl//VTGdAoA?=
 =?iso-8859-1?Q?MVyS2ahT5z3fZAbuI7mi+/6etMwlIh8Wy6hDXHQK0GeaniEhcR18MncCj1?=
 =?iso-8859-1?Q?Hn1E4V6pt6dxZwGW5X+hexQjzhRpUhR8d/0Z+Cgtc2XbrUzqrj8kmmir/q?=
 =?iso-8859-1?Q?rbF87MMD7XzRDu900VT/iBS7SXMWQydggBxeBKZU7G+zua43SBEj3asQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	51XFdIS2kn7AUrAiXx4AUOMIquUUsRxX79/Xi6J0n3TtZ4fpco9ga0xh5eSr+UlBe/xR1mcyouM0GxgB4vxB5rN3xxzR5b8kd50UltMDiyaTUkgVjVSlkuFkjn7O9o1OrWi1G5P06E+cnMUQzDAsd8jBNDRtWhnD5kTN9kpqOGvJTMEwwPxRxtDyTk0Wg0g25Wd2aKt0Ds7A8NCwiR4tE1PHGWVdgF/xC629ecikuPQxQ0v0UPf6sfDIANBhaLsQqScA+N6+7WL6m4HRDeIaF8Je9PdkCgNc+oq317Cj6VpFqOwazRSgM9EWLF6OMIgbmoQEbs1238Zhr/A5E+qLBgu1SgqheKalLaURKhEVjXpJf96qo3T+9KMbYfQNnQ/XWp5GR/uow+XrHJXnQN0ZL4lC8TFWBLmCB7W9PqJ5RYrXjVwkD+pDFyfGQPxgVsLJWzx9qQiElsuUUsL5L1KXkGRqaWPVRHKOlnsHkoeVDPhmE+TF6Btygdy//x0dhPCe3t267UgYYhxYB41aD37mop5lqc/v/c0jGP+Yo/d0m7Dr2Jw2bGsJeQ/7+BESVnV5L9v+MoSNUcboK6embEbfpru1RQBd9AQRqqA6Q5sUV2g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c9e36b-d2c1-457c-0f9b-08ddd4494558
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:55:31.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcJcVajW38i0sMt/BrQ+fMsZ2rfQyfHqcAumafcTt1RZ4sKtilhSCGpLIK+rtsdJJlEwI5g4RTP9OdsoqAtrEorRL/mRMp+7cY8IoWDe2B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508050126
X-Proofpoint-ORIG-GUID: p1KGTwJ4HLmmSbYIcKjEPVMF_sKJFgYn
X-Authority-Analysis: v=2.4 cv=bYxrUPPB c=1 sm=1 tr=0 ts=68924596 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TBfmRqh3tgPmFEpE:21 a=xqWC_Br6kY4A:10
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8
 a=dQENeJEMAAAA:8 a=yMhMjlubAAAA:8 a=uubClPX8AAAA:8 a=7yqefdb-mg5uNrFGbVsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=ZLUrnzr5YNwA:10 a=kfoj1ThlphoA:10
 a=zosCLfkllANJ8uAOTg2h:22 cc=ntf awl=host:12065
X-Proofpoint-GUID: p1KGTwJ4HLmmSbYIcKjEPVMF_sKJFgYn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyNSBTYWx0ZWRfXy0/OiXYmzc7S
 sqnZz79tmSmbPmyjDV5IdeC/IQQ1MbXb0oooh1JhQhotk6GuSdyxiMEw/6L876TxXdT3WDv1F6v
 lw1emAYQTfXPZvdtviIkhXuZAc2F5BDc8FJ3wtCx+h9J9S597B1UI4t54ZhqaUL/C4gYh+zV6iz
 kmbIW5OmQylISu74jSZg7ATkfYeSShT/rarYObguB/NrgiXK8H+Hz8a7YCXk3OeqsNYV1IdGtaT
 Ei5JVJxeUmlXtztaUhNDdyusR1X3tP8AMXg9Yz1r8aO/CEZMMB3hrPBYEWaWdBYn+LnAzG4zavz
 hbUKu+p5M8DQdBAisJSDgaFgm261ZwUzLCo3skA1j1EqbvJc0+TlOOkLDCUfeZ+1af4hSffbCaY
 wfmpgfQqwzoCxrg+ycLSEs/U4jPEOYb4/mEMVydwPmz94draWs2OuclsViWwOwa/moodo4j4

On Tue, Aug 05, 2025 at 12:43:38PM -0400, James Bottomley wrote:
> On Tue, 2025-08-05 at 17:03 +0100, Lorenzo Stoakes wrote:
> > Unavoidably, LLMs are the hot topic in tech right now, and are here
> > to stay.
> >
> > This poses unique problems:
> >
> > * Never before have people been able to generate as much content that
> > may, on a surface reading, seem valid whilst in reality being quite
> > the opposite.
> >
> > * Equally, LLM's can introduce very subtle mistakes that humans find
> > difficult to pick up upon - humans implicitly assume that the classes
> > of errors they will encounter are the kinds other humans would make -
> > AI defeats that instinct.
>
> Do you have any examples of this?  I've found the opposite to be true:

Sure - Steven encountered this in [1].

As he says there:

"If I had known, I would have examined the patch a little more thoroughly,
 and would have discovered a very minor mistake in the patch."

The algorithm is determining likely output based on statistics, and
therefore density of input. Since in reality one can write infinite
programs, it's mathematically inevitable that an LLM will have to 'infer'
answers.

That inference has no basis in dynamics, that is a model of reality that it
can use to determine answers, rather it will, in essence, provide a random
result.

If there is a great deal of input (e.g. C programs), then that inference is
likely to manifest in very subtle errors. See [2] for a thoughtful
exploration from an AI expert on the topic of statistics vs. dynamics, and
[3] for a broader exploration of the topic from the same author.

[1]:https://lore.kernel.org/workflows/20250724194556.105803db@gandalf.local.home/
[2]:https://blog.piekniewski.info/2016/11/01/statistics-and-dynamics/
[3]:https://blog.piekniewski.info/2023/04/09/ai-reflections/


> AI is capable of really big stupid mistakes when it hasn't seen enough
> of the pattern, but I can't recall seeing it make something you'd
> classify as a subtle mistake (I assume it could copy subtle mistakes
> from wrong training data, so I'm not saying it can't, just that I
> haven't seen any).

It's not from incorrect training data, it's fundamental to how LLMs
work.

>
> I think the big mistakes could possibly be avoided by asking people who
> submit patches to also append the AI confidence score:
>
> https://learn.microsoft.com/en-us/azure/ai-services/document-intelligence/concept/accuracy-confidence?view=doc-intel-4.0.0

That's interesting, though I don't know how reliable this might be.

However it's for exactly this kind of input that I proposed the topic :)

>
> So we know how much similar training the model has seen before coming
> to any conclusion about the value of the output.
>
> > * The kernel is uniquely sensitive to erroneous (especially subtly
> > erroneous) code - even small errors can be highly consequential. We
> > use a programming language that can almost be defined by its lack of
> > any kind   of safety, and in some subsystems patches are simply taken
> > if no obvious problems exist, making us rather vulnerable to this.
>
> I think that's really overlooking the fact that if properly trained (a
> somewhat big *if* depending on the model) AI should be very good at
> writing safe code in unsafe languages.  However it takes C specific

I fundamentally disagree.

The consequences of even extremely small mistakes can be very serious in C,
as the language does little to nothing for you.

No matter how much data it absorbs it cannot span the entire space of all
possible programs or even anywhere close.

I mean again, I apply the arguments above as to why I feel this is
_fundamental_ to the approach.

Kernel code is also very specific and has characteristics that render it
different from userland. We must consider a great many more things that
would be handled for us were we userland - interrupts, the context we are
in, locks of all varieties, etc. etc.

While there's a lot of kernel code (~10's of millions of line), for an LLM
that is very small, and we simply cannot generate more.

Yes it can eat up all the C it can, but that isn't quite the same.

> training to do this, so any LLM that's absorbed a load of rust, python
> and javascript from the internet will be correspondingly bad at writing
> safe C code.  Hence the origin of the LLM and its training corpus would
> be a key factor in deciding to trust it.
>
> > * On the other hand, there are use cases which are useful - test
> > data/code generation, summarisation, smart auto-complete - so it'd
> > perhaps be foolish to entirely dismiss AI.
>
> Patch backporting is another such nice use.

As long as carefully checked :)

>
> > A very important non-technical point we must consider is that, the
> > second we even appear to be open to AI submission of _any_ kind, the
> > press will inevitably report on it gleefully, likely with
> > oversimplified headlines like 'Linux accepts AI patches'.
>
> Oh, I think simply accepting AI patches is old news:
>
> https://www.cnbc.com/2025/04/29/satya-nadella-says-as-much-as-30percent-of-microsoft-code-is-written-by-ai.html

That doesn't pertain to the kernel specifically.

Of course code being written by AI is old news, but there's no doubt that
tech publications would JUMP on anything even suggesting we are open in
some broad way to AI submissions.

Given Linus's rather neutral public position on AI, it'd certainly mark
what _would be perceived_, in my view, as a sea change on this.

>
> > The moment that happens, we are likely to see a significant uptick in
> > AI submissions whether we like it or not.
> >
> > I propose that we establish the broad rules as they pertain to the
> > kernel, and would like to bring the discussion to the Maintainer's
> > Summit so we can determine what those should be.
> >
> > It's important to get a sense of how maintainers feel about this -
> > whether what is proposed is opt-in or opt-out - and how we actually
> > implement this.
> >
> > There has been discussion on-list about this (see [0]), with many
> > suggestions made including a 'traffic light' system per-subsystem,
> > however many open questions remain - the devil is in the details.
> >
> > [0]:
> > https://lore.kernel.org/all/20250727195802.2222764-1-sashal@kernel.or
> > g/
>
> We're already getting AI generated bug reports from what I can tell.
> It would be really helpful to see the AI confidence score for them as
> well.

That is definitely an interesting additional data point that could
potentially be helpful here! I wasn't aware of this so thanks for that :)

>
> Regards,
>
> James
>
>

Cheers, Lorenzo

