Return-Path: <ksummit+bounces-1228-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731D905B24
	for <lists@lfdr.de>; Wed, 12 Jun 2024 20:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823942899E0
	for <lists@lfdr.de>; Wed, 12 Jun 2024 18:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2E05029A;
	Wed, 12 Jun 2024 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="as5MESKr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e354veEv"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15CA495E5
	for <ksummit@lists.linux.dev>; Wed, 12 Jun 2024 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217333; cv=fail; b=prYPF3Dul5dECICYLtF/PKyIOuCDJWn+/R4ZEXApF39ddBkH7Fcyy7JJeK2/VbEA1BQfhFgwTkADUJ5lYnIEWSLB+RwKkyat8dlv4padVxuVgGs07tsvA5UTPcnokvJyZtAaeCiffOq4NC3BaMyYCVGA/P+HR0Os33WrSXWwXVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217333; c=relaxed/simple;
	bh=USQTOQCQ4zGh0/YWGlBoztNl/K0CD0Z+WvU20naYxio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EAegCBWWExVgEf7O6QWc7OBaLi3qn3IkGfBwLbP2YXv0UdEUKNvW+8ezVHA7VVc76LuOFwZUTIYKdPr6hrI/FxGFQ2OgZ2UyePk6G3UKWyIqa/bDie7bzV0VtjtsyYzhCZLsc+m6H0BNUHKAqqqRERJwc/2hK8gQ4wfUVj8eeKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=as5MESKr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e354veEv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CFHCNS019494;
	Wed, 12 Jun 2024 18:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=FcUs4MrBLHDIqUb
	1McvZye+6NijtXOrEC8sQiHX3pbM=; b=as5MESKrSvzVFZv6e2a532yFUNijuF1
	fz3U5BOs9gXvawsxC5F6OciO2iLCe64GXohNJNdTuOqmBtq03I6U63lCtngfbo5C
	SxWv2Kg+Hrl6rKnzKAXX48IA+hEdyo43R+PPcrv9K20qb+/QMNjUsCkn7LqQ/mR6
	uVdD8ZwIlVwRcQ0ih/5c/5VjOkjD6os3FA+9goG0p0bBbc0tyRRnihAlHVGboH+b
	u28EjVVDozxZNN7KIx0dnhSveu7zXFoSbmZZTv/s4ZDZ5Mv5CxlNfzEKQw5LpNc2
	Mj4JYyS/dVL7WzKkLgzYaxEuyutiPa3aAQ0YclyDKkW+N4SkSVdaqkg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh1mfu43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 18:35:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45CIB4FE012576;
	Wed, 12 Jun 2024 18:35:23 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync9yvfaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 18:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1k3VYaWeR2kp6XjNnZn06cKpM2GFk62yR+Z46N5Ai7s1Y64KSIRuu1zTu1CkmZ/OFgle8KhBVc8+dauvntb0gSTIzt6Tm8Zt1A3pb5NzWzuE7ZDYtYwlgBk8qCDsBbkTJ0i/mlQsB4KLpuzOuZAvXEV1TZU0ul+uP8ZJAz5F1MZF/yQPpwUstvznK2/xJ8Bz1Av2Z6WOYp0XmimyoIHqMmvvN6jpSkw6ZnHzr3q54aX+AtmQtde38z5nWSQrDIPUJwuJENM/c+RqeDbWiNTycXcWygWvA0tOhcPuJSfdW5o9Q0Bj2IVB9v05+BgBPSEUznNN2DQfPgJXioaEO8EKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcUs4MrBLHDIqUb1McvZye+6NijtXOrEC8sQiHX3pbM=;
 b=TF6P9MN1H3Hz88q4LiW31dih/M+oLTRv3xMWZNgiU6OOCUUk8r46g1VWo1fuQ0aPXvatOzaPVa+T6VmZTo7XbpUKczS6XmGK0W6TzSgVwzHKr8FjlFvs031H/tYKBEPpPi7oAesJ5OmF7NxppfyhyRdL138knaAXIrnZhMIVkscAHrBQxBRAwife6ANoUMNmn+RFpFhb7+oW+f6/KSiHlFrf6R07Wb3Ed6QOL/pA3V+jTuTHXoqKR3PiJYNqRpMS+C918p0qCX/nxHAIJMtbEvMa2UpZ3c4eUg426YEEitmx5Oy4ulJIMQzQA5KzDyqob2Jk2sRrvbDPzKgSDNEcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcUs4MrBLHDIqUb1McvZye+6NijtXOrEC8sQiHX3pbM=;
 b=e354veEvjgmmU0pvywjoFZ4fK7AVG2VRaIiWPLx78BLUDm6U9nG5dppzW4woXtaEgAwnyTNeWHW/okicLe3CAFXIS3dTCRG9WPw4gq6N4F50fLaujqOr+l2vn3KkbVuehQmst3j4cw1IkBqVduSxqakQ2AseVYQJ7hbU0PgvuJU=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by DS0PR10MB8077.namprd10.prod.outlook.com (2603:10b6:8:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 18:35:21 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%7]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 18:35:21 +0000
Date: Wed, 12 Jun 2024 14:35:19 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Guenter Roeck <linux@roeck-us.net>, Steven Rostedt <rostedt@goodmis.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [TECH TOPIC] regressions: our workflows are the biggest enemy
Message-ID: <f6kqhk72iujjugt3nb7wsiz523meti6hnfzptukjpqjvkybckv@e32yogihxcch>
References: <5182e50a-3d13-4edc-8f2a-a024e0588177@leemhuis.info>
 <20240612112622.21bf7c89@rorschach.local.home>
 <9b28bd22-f4b7-4bb4-8471-cb131347b6e8@roeck-us.net>
 <47793732-03f6-4cbb-a2a4-393ad9c96de9@leemhuis.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47793732-03f6-4cbb-a2a4-393ad9c96de9@leemhuis.info>
User-Agent: NeoMutt/20231103
X-ClientProxiedBy: YT4PR01CA0276.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::13) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|DS0PR10MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 5202929f-08d5-49a3-4507-08dc8b0e6a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?au9E/NH6+yuZG9iHU14zTN+jBacmYaRvOqjHxdKFmlEmKGR/sy3+d0fT6Zyt?=
 =?us-ascii?Q?3tgNoC77ZPgofFd1m6Gf428xjc7TLZXXI4ovF6d6iz1pSVkmUqzmFbl0loUj?=
 =?us-ascii?Q?Rv/Oo5FpoESz2QR7TbJd5C9VDbMZ88ix6lKom9vtP6PPWMr0atOjSF+Ershg?=
 =?us-ascii?Q?fXaHB1zC0sPm97Xp3mYoWmuSM5yDD5lnqBKDaLHuIA2g7D28qbJ5Ava9iudk?=
 =?us-ascii?Q?7eGrK9KjS8mkfgO1sKDGrupfARO6k5sKd9Qzl0sJJ9Or6/TuzwKpinqSBcWY?=
 =?us-ascii?Q?2tr2s80u155N89hkhTEaUXmSlIaYk4RQ0NGXdjYumiRfVsGwKApT54fOWmwe?=
 =?us-ascii?Q?9ThdveeioSpZVzl2BKbzK1POERwZv721SJ0uIhxExbMAsq0QLmPjAFZ8vnCw?=
 =?us-ascii?Q?Crb1WX4vTMSRv8ZRSvSQh6whmC3bZSK+uMJYQKrV1SZ2n3lhJ8g0RAfyddqX?=
 =?us-ascii?Q?v8tIkVIAdh/3uLwu00DORnR8IUPZ2+bfrQETZ5+TekVVVP36EZQxAbM2PYmt?=
 =?us-ascii?Q?v9dC2xtr7btCxTYJFg0gjJ8XD7d3tMvHPc4v2Q2tTKEI4WUTOvdo1L+qQto3?=
 =?us-ascii?Q?2pXrX6/gpnqPGLFMV4+J5WQQNFAND9+4zCQGPIYxpJ4gzcQynj8aVKH8dDMI?=
 =?us-ascii?Q?GGfpl7jYlgWjaG+HOVDN8qyNcitj0uJYJ/qPNZy4K9ok/iU4XWnaqYUwpIvd?=
 =?us-ascii?Q?VuKjluyKr9mM4Nqd4K0CFj+1POV8jlzPth1h6FNVcbmNqRrSdLiY0O75lfD2?=
 =?us-ascii?Q?Jhs0M9CTZoJad0v3EL6RnDhGyt8qHLDZ0EfSGICWwUtT8xn0in7s/jA+nlyL?=
 =?us-ascii?Q?f29u93gK2E9QegVvjGVhONiYkO7zW7QufgdENMMCN0tdyyGTjNA1slZ73Rza?=
 =?us-ascii?Q?aQFX4njVuFh94poTI0azns6xq2m3P2eS9DwduVutQ7fBBrUyIBdR45in/8Qj?=
 =?us-ascii?Q?Ln/1TPHECiyF04Ans/+N0UQIa2DVIYNBUdnvJmk1vxeRbtLXpCjGwKHavxEV?=
 =?us-ascii?Q?cDL+wxe4IB8biy9uJwlT9QLXyCY9L28DNsM3lqpQTKKhy3zoj7vOvgy9gkgQ?=
 =?us-ascii?Q?s1U1aElH1yeftkd4wqTmFYGG3G5G1czI9E7Yj389wVDjBjYD+dVYI/RcwuHL?=
 =?us-ascii?Q?mGLieOcj5WwemUBN/a78FF0WIIn7H0CL2Bm83Ve6XPSwFkdozMX7d83t4R9K?=
 =?us-ascii?Q?AGd0/0eQYCqKAx95wVbIflrg3c1vZEn6saGMpyU+MhamYVSDrkpwp1kmMoup?=
 =?us-ascii?Q?fQRhsPtkM1RTku/atTluvtkbniczo2OP2Kvgb3mocnZGz3De5REQkOoE4qpB?=
 =?us-ascii?Q?N+lhUa0fVwhOd5pbI1RBIH5r?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0qdeyGmJiJMlwkhuv3GB958Q5hcQMe0JcgHbubOoobkzJz5u+ZqB72hDGc0u?=
 =?us-ascii?Q?SkolhHjcyy96jSLX2t4gAVWhJbJbNyjjYXc9WHes/94jTDMV5sC2VwaT02QL?=
 =?us-ascii?Q?s6ZKb0k4qEo5hY2gxVa5lmrNHaf8QSAFeGpT91ojBLbJY067o1tyMO3wIWk2?=
 =?us-ascii?Q?p71Webndo1ZjQU7A1/+ptmUTtVYoPh8zlAExrIIrW9TAyUKjwK7zze2jVpj1?=
 =?us-ascii?Q?dDVdWy739xq5Yinh6PyTFn4b9kWZA9/h8XQS6eYRA67GTe0RnfePXXiF5MEK?=
 =?us-ascii?Q?1GAvtrXfjWiP4T6EDAd0gR8RVD+QYRnzesJ1WBENVCXnG9pt4fPlc6H6wKyc?=
 =?us-ascii?Q?hkO3k1zhumjpW168th7E/3wtrgzZWHtJrCcTolOXPZWCr29O1/eLzkp4dmkJ?=
 =?us-ascii?Q?AkyPJEpxgts18zsAaEKdZQ6NFqGfCXyWo7OKaDiwwuOy5gVpZnnuBL/kT7b1?=
 =?us-ascii?Q?Bo1Nmck84BX9dcSPeWaQvs9GEUFl8QoOk9eaG6lrnJwZdQkes/D23ZtLDCYO?=
 =?us-ascii?Q?XOyimBSz2Y6tL/T5QTM1LqQz0Z5JneC1ehiB0XD4xhtnCdjpspYe7tdW/eAL?=
 =?us-ascii?Q?/paMPn37haGMyf0avufw2XVJGkwCK/yeJa+lmSVwkzxjJbdv+bbylQLtHYQE?=
 =?us-ascii?Q?cOyD085hkCDEnXfB280xm5nThM2gCbt6c9865XjvvvZ9/tJxHC4tcHKeWU+q?=
 =?us-ascii?Q?DaSF05WhQpGzA6NPHsdHlW8WHqVKZqq9dU0yOEQN1nS7R2Jn8vL8NHaKZMll?=
 =?us-ascii?Q?SF1hxR6H/YVErjchD5oy7MMJxXCMhBIxT7BzLipJ2q+UNNBjki69erqxIPmL?=
 =?us-ascii?Q?/iO0FSv97OU9r4Ocbhr7bO/GvBUtu2eotVs9SMWdEJR5PCIHDiedlmfWzfS9?=
 =?us-ascii?Q?ucIWGMfzzZWjPr72qnJwtwKhFL2m8XXIB+B4FiO35jLx3rH7t7OYf0oC0Vzl?=
 =?us-ascii?Q?qjQoZN2d/7F3wownM5qN9DQdqf5CjHeXAGg6dVBtKUa3oFrpIQODhAxZowUN?=
 =?us-ascii?Q?mwpI4WAZr59laXBQ1suyo6VXEvoAXXTuScy/gmyh9Nd70JQEJpvOJKf9Y5UQ?=
 =?us-ascii?Q?LFGc1RjTV49vz3agXmorpvBxWOXuH3K/FiTO/4c0PVqcN4ME7lB3kACs22gw?=
 =?us-ascii?Q?Rcp4ll4ZHZPylLBVd+j0bLDIQcW4XE4br6Xe58CxMZ7u3Xn/UFdPamhzrjVA?=
 =?us-ascii?Q?5eOE5smTXz2BqhdU/0w2yhGWkJiMMC0tf6FuLfOK35LdePRPXMkn21DHe415?=
 =?us-ascii?Q?HPCrEZBtxNf/+gXnKCDb5uY+XSEP6oR1NCJvWxIoIO0xsfoXhbNklmduBTuU?=
 =?us-ascii?Q?dDC2NiVvvmYlkGIpraCoAIWVpR5OBA2t8QKjQniC0NzeVMMkSHCVdCAWn+3w?=
 =?us-ascii?Q?9P2pGOCMrYmfUijBv0uKMFK8Kx/cn8g+55PPsuO0ze1OOgnHzjrmciNAq1kD?=
 =?us-ascii?Q?F9a3RB0lZm3o3MLdNJCvolGMk+Ebw90M8ZGWR1nFh8e2zknpiQ/b64lUxluu?=
 =?us-ascii?Q?3rAoHL5f0II6FdKMHjRzfEQIE8y886W+KAAzrSiXQSA2VYFqXfVdL5qZFu5b?=
 =?us-ascii?Q?54nCiRPm4E++xJ0RrSE4IB05KRwJonIpRd4F9DQQh4Dy58O2atOxzg3Zs9WC?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Tz194gPJPQ0C/0W7ESIIUaMTmBx8TyNH/dS1vdjkzvCiY4MsCqDP4OakCXqhUrn+Fvp4P4jqRKHhNP9jZIIgK+XgQRkHEXP6rzKB1UW1s7QOQ1oSMo24gh+E6S+JZFw0h/DYQWTdDrn2SbQtOIidCRnjZNez/n5f1zRANmq1ULGN0N6uqc3EMt1SpjxR96UhRxrVhDBtLf76BC18b27ssmOBCZou0uPJhGdr/o7km6AeCO8Qrfwjw5yxeiRU9hsIEUbpOa64VpruZQP8dEW0K8ap81B6y6F5yYZARunE1uZ+ArJbcNxi+zFDDsxZoqCIlIEQA95c4vau0IEGldtvE9b+876OnUg72A/UVLtvlQmqpcpsBosGS280YxmUcmX13zmm/LXBAfhsUEac2JnRIjkH1RUHidRQqAFXZUa5Jeyj8M3DsSEa6rTGMjUwStljEXem4VMchzBvLo6b7tHFGgONBkTiI4FhBlLZIuMm+npRTXlYhBRzgEqSSADdJe18bDMQwOWOnNubmJ2KdYgMVo/PjOjTT2f6MgL0iEX8YgHgPfZ3i8+iaJkAeC2Mj5bQ63QLfUoBdeuaGfsDfMUkMpYgnu62jT+JTYOx7Eo7NdY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5202929f-08d5-49a3-4507-08dc8b0e6a8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 18:35:21.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqH21R3VYRv+w9GVSh0VzRF43UYsFYxzpHWzM65ZwOlY9vq2cw97GdsSfKU0fqcHLZWlxFlOD7iRs9/q2FYESw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8077
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120132
X-Proofpoint-ORIG-GUID: CqkDlm7UrUDipBsWpoLrBcEXqT7o_BvF
X-Proofpoint-GUID: CqkDlm7UrUDipBsWpoLrBcEXqT7o_BvF

* Thorsten Leemhuis <linux@leemhuis.info> [240612 12:08]:
> On 12.06.24 17:50, Guenter Roeck wrote:
> > On 6/12/24 08:26, Steven Rostedt wrote:
> >> On Wed, 12 Jun 2024 08:34:42 +0200
> >> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>
> >>> The talk among others will describe why some workflow patterns are what
> >>> frequently leads to regressions -- and why they are also a factor why
> >>> some subsystems fix regression quickly, while others take weeks or
> >>> months to resolve.
> >>
> >> The above looks more than a TECH TOPIC.
> 
> Stuff for the maintainers summit is still in my editor.
> 
> >> If you have real numbers that point out workflows that are an issue,
> 
> No, I sadly do not. And they would be flawed anyway, as there are many
> regressions I never become aware of -- and it's not really possible to
> determine from commits if they were fixing a regression or not. So it
> could easily be possible that I only see the bad cases and miss out on a
> lot of cases that a subsystem handles well. Not to mention that I
> currently miss out on a most DRM bugs, as they use a external bug
> tracker. Regzbot can monitor that now, but I have no easy means to
> become aware of regressions reported there. The idea was to start vising
> a handful of issue trackers every day or two and use a boring search,
> but as of now that's still an unrealized plan.
> 
> >> I think this should be discussed
> >> at Maintainers Summit, and perhaps we should start "encouraging" people
> >> to change their workflows. Especially if we have hard data showing
> >> that it's not working.

That would limit the number of people who can see this discussion as not
all maintainers are at the Maintainers Summit.  I suspect that the ones
that are not at the Maintainers Summit will be the same ones who will
benefit most from workflow "encouraging".

Although, I'm a little concerned about what I'm singing up for here...

Thanks,
Liam

