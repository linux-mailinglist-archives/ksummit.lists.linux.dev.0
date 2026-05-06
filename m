Return-Path: <ksummit+bounces-2911-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDyrIIre+mmGTgMAu9opvQ
	(envelope-from <ksummit+bounces-2911-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Wed, 06 May 2026 08:24:10 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 061354D68F5
	for <lists@lfdr.de>; Wed, 06 May 2026 08:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3347300F9D7
	for <lists@lfdr.de>; Wed,  6 May 2026 06:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F3330B50C;
	Wed,  6 May 2026 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K6eP06pi"
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA21DF73C
	for <ksummit@lists.linux.dev>; Wed,  6 May 2026 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048617; cv=fail; b=XB3DPddyN3sedr5VZPe9ISHnSetaUnWxP4AGwiiOt2TvCdNKxBKu3sxZd8Oudojpqx3KjFTF4YTRViTPXvv5C9/kyT0ZtFsZx8fcbQ3+YFY1Kif74u4111MlerywRqU4zIgrbuv7roiK88En6gfwdiZxKl3hc+9DSrRoIJxLmhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048617; c=relaxed/simple;
	bh=tPd/w34/eSo5YjWry4c8QF3iUtESgO/3rs2Z8Ym9KG4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=jdWCR3ogOMNOmv5ng9GkVdLTRok8hSCqMpe+Py1DqcFJlDJZUtgATdKBVABorjTAoOcr4jiZw9p+e9+IjQVB9aXgDD1uVn7s5HtyPlZINvcw964i9NOkJvnZoIv2pmgD8oLNp0t87eIPXXi7gaj4tBXErAjtpDEdUitCKPRGJ6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K6eP06pi; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z778rJHtEHapKoVicjYAuiktVgKIoz+j3pdtkKCHwhy1aFDrbVOo5/4XaKfnu+wemadr72A4JtTmVORbOkye1jexaq8BkwEBP26vxHSVS+LNGeODFFbMn52Hr2MrwhfFGN+qi8pT+df9K07VFiTRIB3ahZPoDvk4VaEm1m0YtJ4yp1dIIGtglLG2awsfud5swOoJBDPpYT3YigI8KKQaU2mbsvIDrscCWXnjURq0T5ndUBdyA+6I5oIhz/y6JElckB8b21KQYCsmNkLzoYPQUGghxHNkQxsieEN8cBMjwx6Gz3qT82wJFNH40yCTa9oKivrBsGAxeT2lYarEk/oCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZm24N/cSjxtcFMRcS/TebaPmO8vL3YSVkmHHH5gtBI=;
 b=to0pjTQElBwt39zPkZGdjaV+N1LS/GLAolWGyFzdw+i6fJ1DINnxKOlcquC4GeSoW/gHZAlRr+hQJfL32dpEPpIAKDsC2w+YLIeCsZy1hZEZYhY8xoIXDwPhChOCsnH1qcN+z3QpihyGcZ3QpzJBPWJivdkhM36HEnbNR+iwLQQ0OYy76cdGloAuhTykkvwR3GqA2tEWMx8s+lL1HWca9Wcd1H6otzDkhTAkIVEwnVchN6fBrltcrQnGr6kkDrQQAsQ+R7P4lvTWMX0FlpeG8oyYJhq/hwZQzgLxKvEdfD+EmLmpFJLUtf8qroDYb2ZwYZQ3j77SLOxUXtrdel2L7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZm24N/cSjxtcFMRcS/TebaPmO8vL3YSVkmHHH5gtBI=;
 b=K6eP06piT1EmyjgAKVTwlCy3TZGo5K0I6FYh/vdiZZDYjTtQRrlLC9Ar0E02CdSugoFiVBOvwcPqbCiw8UirkRM8jYKiRDpHQjRpfYah2u1x5//rPhW3JTm8yvwd1NRRGg6UGY0KUWjWXucap92p2BNpSmxwsiTLf3l8J0n3skw=
Received: from SN6PR04CA0090.namprd04.prod.outlook.com (2603:10b6:805:f2::31)
 by SN4PR10MB5559.namprd10.prod.outlook.com (2603:10b6:806:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 06:23:30 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::fc) by SN6PR04CA0090.outlook.office365.com
 (2603:10b6:805:f2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 06:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 06:23:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 01:23:30 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 01:23:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 01:23:30 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6466NStt469129
	for <ksummit@lists.linux.dev>; Wed, 6 May 2026 01:23:29 -0500
Message-ID: <4416c880-e5c7-4dd2-997c-a5b1c4f013a0@ti.com>
Date: Wed, 6 May 2026 11:53:28 +0530
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <ksummit@lists.linux.dev>
From: Moteen Shah <m-shah@ti.com>
Subject: [Initramfs] Topic: Initramfs Demystified: Owning Early Userspace in
 Embedded Linux
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SN4PR10MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e680a8-7ddd-4faf-840a-08deab37fe1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CHQ66nOd2ONXdzyyxOpawcuqYGKTfDrtJHWd3xQR1LWUpz0yY0mjFO9XUCsWsa2hiVl19ko9vBr7zIayI5m5ZoN+xLGglgE+IpXPP4WCGIEmxdRWokKWaK7wojzZAsZryESP05kRmHpL1dmbUzJR0+CaFLqH1fqJivxfBovj+PJyk4SMDCh9JCrulbCXX/frSitYWhsSIav0+jvQg8wi5ucOo/Rh0FIdjHog9X3FsHvdkcriA07/zHwgmD2XkPb9KSVXfGgbdd1xcwFha1tcjDGsB9L/viDL2C4kdsYDqkFZSylGSgnn0QErOdBIN8BkuSJrmYqkvuWLF/LCZSXgW8hZetSlJwLZy8KPVdhdRg3PzwHo3RboJgonWlA6+kQW5OK5pF0O71v6X7uEqXy7CzD+ZNqERZv10QFr8dhyyE4gGev30EUYxiuNabrWq2tnKog2Ils7iEFt0858gfSjrb/b6voNQK2Gj0TtaQ/tK3QIufqRnHI09OlgHUgzluk3dUlp63/8RrPmgtg9IaMB8CrsrAs1TkRTaICNcl2IwkORNZ99DzmaX3xY5RQIY11T6oW7AIcyxFfVsb4Zd1iR9qerrEvDlLqWgqZLkZN7gjnC4eSc3UWdt76K3P+MZqT83s5YH6v8VXJ0sfkQg0JLY4zvT2ve4at7qCM4LGd7efg6DDBZBQaebmoBww0U047pt5805pp3y/k5xQit9jOcDi/gtmGMWykzGuHTvQBiJUc=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iPyKcAVVtczwODSCX7a0hPbdWg/UFYdyuqxnKEIiSH/UIbRMMeePWqfYVdapy0+6/QKrMbyl35/5DBm/dTEvomA9Qijj1oD6YyxfQ6Z+9o4x6eZwTtIRiDtOf3U401sfXmyR35Nh2NFJc3FttgdEwhGknnnTHgN+4ovNaHqq/VzY5iR9jVzC7cdmpEWVQxO75WgnBqKXElvzaWZDvttx5XTAcvoAciHQm7/hiT4+pZ7j4zp7z9iT00gadVXCg3A9zSuixhBHL0j9YBW8dks63p5YumyVzoQhqpqm//0HbvZiosEF+SEHgqGl/szaKptvLxJDH/cVaRA+qbe9YkqzTYZc8qv/RSgyMw7ZTddFM/bttjXQgouEE+6u8FxdH8ZkdftIPXrdk7EPIB3deqCT2wzG0A8bfVFUfO36s1iP4g5QBBhh2MgFwz9Ybt0HmevX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 06:23:30.7472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e680a8-7ddd-4faf-840a-08deab37fe1f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5559
X-Rspamd-Queue-Id: 061354D68F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:mid];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m-shah@ti.com,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2911-lists=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Here's the proposal I would like to present under Kernel Summit 
Presentations for LPC, Europe 2026.


Abstract:
When an embedded Linux system fails to boot, initramfs quickly turns 
from a build artifact into a blocker. Most developers rely on it, few 
truly understand it.

This talk turns initramfs from a black box into a tool you can reason 
about and control. We start by unpacking the cpio archive the kernel 
expands into tmpfs and trace the exact path to /init. From there, we 
focus on practical early-userspace design: writing /init from scratch, 
handling device discovery without udev (devtmpfs, mdev, static nodes), 
and deciding what belongs in the kernel versus initramfs. We also 
dissect switch_root vs pivot_root—and the subtle failures that arise 
when they’re misused.

Finally, we cover ARM-specific workflows, including embedding initramfs 
into U-Boot FIT images and handling hardware initialization before the 
real rootfs is available.

Attendees will leave with a clear, portable mental model and the 
confidence to debug and design early boot across Yocto, Buildroot, and 
custom systems

Regards,
Moteen


