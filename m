Return-Path: <ksummit+bounces-2082-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC5B1BCB0
	for <lists@lfdr.de>; Wed,  6 Aug 2025 00:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7F2B3A295C
	for <lists@lfdr.de>; Tue,  5 Aug 2025 22:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B40D2586EA;
	Tue,  5 Aug 2025 22:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D+mGKXdl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TmizNXee"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B121D5BF
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 22:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433264; cv=fail; b=jC2l2ijtL1S+EB1zLrQA9K4GHdFJTo2mBCDcGl0LldlgXx1PbXRXmkqJuROLvmqddyXWqXYRG/pbMPQ7zRPD8rCUtzBU/Y1Jkw2BuIbBI9za5QdNXrXdHehBC8Xe+pFsk3EIczC5P5tX7DjgzT9NHPbkGTIT781WxSThn4TOKfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433264; c=relaxed/simple;
	bh=Re++Wo7oOZg1+eEx281rfDtDhtVJ2vNzf/rOT20nlk4=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=MeHb8l/ljV+DGRqB9L8sjINiJt3t4K06GsuKgu79VM1NAg1/gqcYFnt98CX7NJQ3sFJ9qSCmTqZmiNUxDNXeRskhgeld8gY9zOFmAGqQ2kqYd0ZtNZxxgdMLPsaePaFgs5VejpoR0ZyVAefrxo1Ix2VWFKFIM0ESGZu7KpE9sPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D+mGKXdl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TmizNXee; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575LNF5M025327;
	Tue, 5 Aug 2025 22:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gtjiTLjCvtCZ+DxI9I
	B6kgrtpeil5E+lfix/OnWWSm0=; b=D+mGKXdlCJ8/x4s2yTuJo8GkfU3u+csjZD
	Q134NHRX5X2/6JRwE4zxZjeb6zWJ8o4DkEnEr3DQPVjihLLiYwXaJ19trrNrRbir
	ucAhXBXPyXyh35Z/oiHmZ2hERq/dRr2XzMqJVcZ3xvMVFNhSYRi1vPRmYZGJq+YG
	V+6Znfe8kZx/8Ud+rQHxOvepcnfTynBWOuu9mUqx/gwP3udTti1eBZen+1N2GtAT
	F5FrL7VVAjHVTQiOX44rn29ngJ3AqjCaAxZQmkOlUHybr15rhhIHd+QYcO4g00O/
	EniEDr9FM91mAvvwR1F1ZnekDt2m6wk4iomiVqLxd9JfQb6Hu8QA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvgredt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 22:34:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575Krl8R009685;
	Tue, 5 Aug 2025 22:34:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk8mac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Aug 2025 22:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn27rbNBxa30VmunvS3cle9hyO7jzJtT3IHVdl2g7/geHRMJsRTHlmcRwfJZZ0cVCfP+wucBYLDllsxTs5RhxKuPtxKk7oC05tXzln1LqcXsF7gNDqkehySxFkGU+YpP76vOJhsDLD/7aFqfn1vHha6sK9jUQb7IYyjelEIu6b3liPVgYwALJ3uBRVxZrcMbs38wUQJnbpXs1m6ZUi6fOLZZD4RTt8sZeEtyIx/9z3M2DwqpnnAP4oz9hk/S0oXqRMHhZB+O4WXysiPf5KDJo/fv0C2z5rGtAo1L5RQNvkIsMCNIi1NrfvQR9WQ6G3piMNPLkDJ4nuoQuICWgSE/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtjiTLjCvtCZ+DxI9IB6kgrtpeil5E+lfix/OnWWSm0=;
 b=vanpvdxfcjDDihPlGlh+BzHbFMiDU1pfsd+pagCKz57kUYH2+na0DyXICH5scsKNPXXeQKU1ZAapbUNTe6o4B2gw3haNMAPCKHTOcuWBo+nkSBnMoBtoSnADa8M7UFMi4PjtDaTLAHJTiFBiL9DW2i4KSu9tqqacc/nZqc02hwtq/hFUcn/xiK6/31hrkpZ7ULAkDcfwH7O/6Q38KXbZPNFkGsCdhWYYLpFAqAhXNtE1MpXj5n/F8VZVOmn3nqe08GbanUoEN6cnQM/Jf62QdzdLAGCEZD0/65uDDuXNzPBg4xxaYMmdhUDT2MAmDc2jgnknkcvQASIUPAUkOLeMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtjiTLjCvtCZ+DxI9IB6kgrtpeil5E+lfix/OnWWSm0=;
 b=TmizNXee7PtO3lOkB8Ew6p2b3axntRvNJjexDk8k/XCvYUPEqZFFXLnU4UkJuBBdPonj7KxYj75VQ7niD4+BRc3WZMTM+6TujsmDr2N3r4jaAjbSSxVteqyE2mbFbvpozu4ry8KAR8R13NAWzJlxFvUuynKY5qXgoap6xlxDnUs=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 22:34:15 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 22:34:15 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        James Bottomley
 <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet> (Jiri Kosina's
	message of "Tue, 5 Aug 2025 23:39:58 +0200 (CEST)")
Organization: Oracle Corporation
Message-ID: <yq134a5ctxw.fsf@ca-mkp.ca.oracle.com>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
	<cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
	<2025080515-grandpa-prankster-ee83@gregkh>
	<p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
Date: Tue, 05 Aug 2025 18:34:12 -0400
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH0PR10MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 62924d95-8ce2-46fb-a8fd-08ddd4703565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dypnhz0u4GN16lPpNxtwOkNuAvqi5Vj3ZDRfXcyrj1HthMpfDhiIvIybxBI1?=
 =?us-ascii?Q?XocnfSTeKrf/MCizvm1hZr9adk2N0a3lJXG7SjVxDRB6+ixXrMAMxg+Im6Ig?=
 =?us-ascii?Q?RAn/lhi+FNUa8IB4VaAF8mzHDiwXN0QYIx4dm6yr99znktjwYzQJ5dVOLfqu?=
 =?us-ascii?Q?gvj2tjgBPjKTz+4G4qBWsNmmqH1SY2PXTYGCzW3lIwQIwsW+zzuEAwYPjpyC?=
 =?us-ascii?Q?anKK+cds2I1uNdd19HgSsnAB6P1LTLRm5AzZF/Z+g7/kieuoHmfpLMt624IJ?=
 =?us-ascii?Q?x0XQ3NTOzhebWyUPm1vp0UN6ArloxLvkkjsXTE8brgRTEY6RYfdHyCg6H8TR?=
 =?us-ascii?Q?TKhMNQbPJxwNjbrB3j7V36VOdLeyKP9f36GGBsDFfzfV2o182dDgVjehawVn?=
 =?us-ascii?Q?MZUt4d5j6nz2g8yFZQA5a7/qGCVdTyKlFa4DTTaCZ0AxFRDH1m2GyK6icMgp?=
 =?us-ascii?Q?ZFuwxh4z47dT1hClbkWmKgsp1E2BzUXug//qfDsdxZbfY3aZEDTL41R3a9yG?=
 =?us-ascii?Q?989XD+64AFtwLqY2/AB3mYk+qIW7uC50vmqTJwzZZkkRoNVhhpzusLPWM7st?=
 =?us-ascii?Q?zsov8srSAvwxlTQ710MNgmBmS1mML+jissgZURnPs7vqze0u+PTi+J55viwb?=
 =?us-ascii?Q?LldycjApfX/NnGoq0QmGRUavlHU9xDLZuMTcqCl6zF41OraC4vAZRbK6smy6?=
 =?us-ascii?Q?J9gIThcXNZUFTTEA4muGsPgDQ2LWxES1mxogEwVBwBGQ/KUjeMYiUMbFuyxi?=
 =?us-ascii?Q?XOiy1pVMx4JYNhyDMdBLtAVGwaj/KsI6456Sb9HtV5hALQIObRjiXnLVt6rA?=
 =?us-ascii?Q?VVqRH2RSIncm5U17fF7pps5wFBsX5nIzQl8lwY0sujRu1LUNid+fK7XtkiiT?=
 =?us-ascii?Q?pR8tOlzwqOTOV5R2ODG4PtKMMFpvsDHkX3+JqL4mI288Gv4xNt3n+EWgmtBG?=
 =?us-ascii?Q?16wTJs9ZeoanfEVKJ0p/BtyJMTjmE4zKszJqhVBIZCSZjaH+CXy5zZoA98Mq?=
 =?us-ascii?Q?+9hAvwg6p2YHr3ofrbQJnQhWh8iWKJRa1kI9a3WqIwI2nLBDrGZUQZWqfp6b?=
 =?us-ascii?Q?obRJqLJRP3+kD0d4Trm741/OH6kyFQsa8ky+rThWN39KnKKQjKrbHq/8t4W0?=
 =?us-ascii?Q?F+U65iRvsk/ybZSrNlEed9uA+irlC8FUQpZ9+L1R9lF8G9TU93G0+RR8/U5z?=
 =?us-ascii?Q?wOyi6ZPmvnOv8M0j8DG7p11s7mrpF5Xk1suC5BJag07PVi9/EkctkCsGDsXh?=
 =?us-ascii?Q?izyQhf7AgosAej1Fgl4fKHCr6b38Git+TFUVSIRPOkhuzL3boxIXMVQ/bRH2?=
 =?us-ascii?Q?Pb5S81WESYglbAw5dSkSaXR2vnOxGnW5rSJ3hcLreJSPisaWKh/f7YCaaGyk?=
 =?us-ascii?Q?yrJMQVrgvOPPCK6RnxsNossM2HNr+fs1UkjuA3z5A9yXhLYIemKkh5hja7p7?=
 =?us-ascii?Q?cCFwybkZNyk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qwd64iYIlc17zg7lJpBs8tV2qhc4ezZ4RBpUhUqcky1o1+iUooeaiXR23imW?=
 =?us-ascii?Q?cGp60xZ5iuMNzGQ7l3odyykBJm9B+HijmiwQUGTof3gyO7hwOgCs3tX3WNs1?=
 =?us-ascii?Q?s9BDHqLpOkJMhL4ZBjVMdeH33vaCsZUx8zh4JBReGwoF/1urWH+NNDgBvj9G?=
 =?us-ascii?Q?BOzVEgxT2BwUWcFWXFvOOfVHTgzayc5ELlOXolCPPRW5f1B/1Maov+RqDbSx?=
 =?us-ascii?Q?FCQtsVhRc/SSolDH22ufLRGk4hrqJZ7KEr8QwT8tDLklIExm5dCAIgb3Ov/R?=
 =?us-ascii?Q?/PF1MQT9NGlLj7pocqLXQ1lh1SaM4YUaAynzoheClsjUmaWGg9eOyOLNNGg0?=
 =?us-ascii?Q?9ugzK51E8113+DC4D3HWMZRx2q9x20eJFiydQaN8zNRV6n8CBW2dWRrrlB6a?=
 =?us-ascii?Q?duE7OA+PvUttV2SZPdlA2aj7OH8r6d1OBigQKbc8imPGDKq8MzvV74+8JAsy?=
 =?us-ascii?Q?h+JA03dNfvvY4/kEFd9NIVtlLVJmul9wOWUoyLex0lBzhKhaxi4+8TsXNBhl?=
 =?us-ascii?Q?wg6+uj3yWPvfLDiw7NdUlWm0PGQIe7dOc5GlvIfkZtZX2bQLdqJlSpHipcn2?=
 =?us-ascii?Q?8soxzAyfdYDLGmcRWCxswdZhemMnG84ng1M8MHijkzZvkmod79hfvVM6d43A?=
 =?us-ascii?Q?dLnEleI4T/p238d9hkaP3L2P3vMHZjex5n2M+bZUedeEzMDnMOq7eRVKU1jY?=
 =?us-ascii?Q?xviq98aAJIrTuSexag/Qv7wM0LQIImnGZzGYLTXhx0Z9SOirr/xG50VVwoeP?=
 =?us-ascii?Q?q3ZCAV+CazmB47HZWDvf6GGtMb8wghrE8/1iiXlBNBZIeAWw/MqTXfV4PN6x?=
 =?us-ascii?Q?IPLDmbA62IDH9mTKoQUigQqm2XknSruk503+nYntYUnkLyNwXCeyEmRbKxVE?=
 =?us-ascii?Q?QDheyUGS6k1KYeGD+UG6kQWjmYUtxSkaV0TzXO6M1rifh+m4DCzKTTtzvqYl?=
 =?us-ascii?Q?WMXLxZ3RMfwCT/lXUgjXbYoRJUsz4KWq5iZUhhBBZpMthNoPytC0TYEUhO5+?=
 =?us-ascii?Q?bVoI1RfIhimUiy/eYRbhWSuTBg+sIce1Vgm7UZVBF6oDFsZi0lFyCUexQPWL?=
 =?us-ascii?Q?2DkPMuEqDHVGhZosiwD3m0j10q4ugLG2VETdjtJyQ1ZWlvVLJFUcafpMWJ3j?=
 =?us-ascii?Q?0BuGa8EdNp9A8nssV2GHMtpk49q/EqcTsEmzicyXTgpVZtmDizJqiJpQ8vNd?=
 =?us-ascii?Q?6uzrHJzOFtRnaRI3OJaAYQhXWh/UY1GjOqD6ULMzcTHkzyYc7us8b8+y1eZR?=
 =?us-ascii?Q?mZrAa2GCzd8eE6/fjXARyQ2GqqbzAlVoej0dDMOjC8js0DMo5Ds/eU50aGt7?=
 =?us-ascii?Q?EmdSpIOVhsURNznYSP/12laNbWhNml6oDotD+GH3vxctmGP5BxB/qb5JxGYz?=
 =?us-ascii?Q?ogP+BjkDIrODnrv9r7T0xRWiOdAwEZxhcPwvCERFvJd1XXII/pQ7uibdLWjH?=
 =?us-ascii?Q?E+NztVDR+NxGRuXrEux7cjIEo9qRW05IU+0P8cEbzOwHM055/p1y15/8Ze4A?=
 =?us-ascii?Q?fc1qExwxVtULl/vwl6Jb3hTg73McRFDBiRV4hOPvTX1Fcw8g4j/9iJ72RkHX?=
 =?us-ascii?Q?bSgaEmsjClIG9hbRForlb1NqkQKlChOoEl1VrfrbQY8J/QdtZcyh7tbGeaMo?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vkg4EQqYWk2e47IcNlw832J9Ed065BLWzh1PaYKAeJq/wCtL2GtT/OKzuGSEX9jj9wvWcwY9ZvJln5o808MhlDr3qsUDwvWHD4AvVLLrexYlndZMM1ECOPSsQEdlgzIpYWFX9/m3juCEE9w/b0yZi775wttWy59RTivJekN56X4DVpDaqL0C81oKi4ztj8ItDt2raH4S6FsC4PfNWcd9RLFHRI05cHlua6ELfyWCqlVt+dLFzlcY0NpT91ggWCWnxeDvFkJgcD4P/eWstJc/Im7T+xj3kOe/4V7EahNdXTya3v27J8VEjCwayGeGj1yD/IEpt66OrvnHO/y/gCT9RIydPFHx3Ht+Oa3npCIChznmISThIRlTUa+sdAWPgNArN3g08d/rIT7Y7CuD7nkWTM3L2ZdPRX6eYhEv6vPpiQPGA3fxpWDXUqhkzZxs1A3BgZFtBwtdOY71LTTmIxXwy7EgvHK3f2Jn5A5nuUHTs54PK+S4nZ7YrrLMWzNiulcT0ub7dW5pq7obSL/bWiFYnef7arTi142T74tEbnLVNBjJ/QLI3TpfzTcpBjAbl4wi1jEU552b+hkZoJGzRGehkh6i1ZnFpNgi6HUnGOTrmUQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62924d95-8ce2-46fb-a8fd-08ddd4703565
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 22:34:15.5757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3M9Qs+naJAVONT6cP8lPt0kUh+laiTOSerYdVQO/LRoYwENoEyNf12dTouUuflocbXU/a1enhngwiw1Qx+GDaH41Ynp5LrT9m/vVKucVzTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050160
X-Authority-Analysis: v=2.4 cv=WMp/XmsR c=1 sm=1 tr=0 ts=689286ea cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=BXI4Ky0FQ5wPvLNnPw0A:9 a=ZXulRonScM0A:10
X-Proofpoint-GUID: NMCDMa64XJcEOiXuPgkpS_XBr1NyYU9L
X-Proofpoint-ORIG-GUID: NMCDMa64XJcEOiXuPgkpS_XBr1NyYU9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE2MCBTYWx0ZWRfX+sNLLZVICyC4
 N5SjbzSpLenT1JdnT2zpvqqk9lHvo7Fh6g8KMhzI+XJ6lxWOEGIimrBqXDSDFB3Gqcrx+S8xjk8
 7MTzLnX4790PkReYASW1ihGcoe+tBb4cfAjtVA7vZ93Nv/QAM9Z5EcDCuiRDCGCMa0HkTRLjY69
 fIsQnTmFHqpKBKlSq5gBPPKIn8ebkqRUwIsCG6AspB8HP1FYcvgtnwmkOrXymqgpjWgF2gN2ASP
 hXozZLnbVEZBhOFEqdHcEhETyShUtadzI/8B0DBne/cqu4ZNDj5bVb4gu+XNJUqLBA/Txv6m6aX
 ylYFO7O+6wT99d70w5IxJrxncoMVrXG2/JQg12g9Bt8N/VOnzQAu1VC6Sa4fghKbtoK0i4Qsm4m
 4hHALx7jhAzrphqdyxNi5kascsjTcy5tCqkVD+q0b+ymlr1otvMNuDjs34+csZAIGG658qgp


Jiri,

>> You can also filter on stable-commits@vger.kernel.org, which is what I
>> do locally.
>> 
>> So filter away!
>
> The question is whether it's really worth all the e-mail traffic this is 
> generating, if people are just filtering those away.

If I explicitly tagged a commit for stable and it applies without any
problems, I would prefer not to hear about it.

When I am micromanaging a particular patch (critical bug or security
fix), I am much more likely to be poking around in git instead of
relying on email notifications to determine whether it has been applied
or not.

I do have interest in failures, however. Obviously the patch author
should be the first point of contact. But I do like to get copied on
backport failure notifications. While I may not act on these, I do like
having insight into what is going on...

-- 
Martin K. Petersen

