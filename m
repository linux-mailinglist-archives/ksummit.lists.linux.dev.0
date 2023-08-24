Return-Path: <ksummit+bounces-1060-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01722787156
	for <lists@lfdr.de>; Thu, 24 Aug 2023 16:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365DF1C20E92
	for <lists@lfdr.de>; Thu, 24 Aug 2023 14:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D4D111B0;
	Thu, 24 Aug 2023 14:19:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870AE111A8
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 14:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7zr/t+/R/5h5dutVHJxhRLAGdvIwj24nDxwwqkXZ3RG1rK/iXDFB6tBctYCpvU45rLTL5fhGErkPXLKEbSUANDC8+PgoK2fiIgPeTiyF6wEw94N5aqCqIOZKbAuuDKLtKTtpdG/wFIPPTTDDPjzhZVCz1vioV0mVs6OoRrWPT6KWmNVXscMXHVjQplCL1pHRUBHMmDvf+ddHTBBTP8uNXcH3XcVAdySwpmBXiOtMkV1WsLDUbC30VcyjPbKCEOZu4oyXIu2FB9xMfA8VgrFFPEbK2TQfZrQroTW/eSRTAv0b0Uww0VCr+6pV4qDWS6Z3yHUjwgFkE5lOolDFBEUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Us1nRXeSzakMEz/q0d1wAzscyoJwAzSSn+ONGFYwUw=;
 b=Q5qQhFS17e69eVdPslfSqmIgzs7/nHKXNu1xTL7/H9DH3nhx9Vc4h+ePEYWsIWV/sP3ygqc3EAUyuruFUu/6b/q52ZBSHFmIQAD2ygEEHerQzR5Xj4R+XsHXem9h3AA63TZT/9iX0ilmZKHF9em+w0RcNKDRvTAHYDY1wsMJNnvgp8BWwJe+0Ln9XS1ModEO0SiEG7QSlsTGztCsOtyYwfzmPvgZX4as/t3CVpFccbz2scBBadyNpPNvtpggpFy43/JOptyDVCGL/PkthpryRm7lFwygO+3H1Z4gwj17gYjENoDVp6OX1zRSOBDRduDJNfTe5gmzPlZpkZ5FfgpizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Us1nRXeSzakMEz/q0d1wAzscyoJwAzSSn+ONGFYwUw=;
 b=p62h1jMXr/Hxdd0sY7n9S5HDcgBtgEwTLtYdDZopxhmUT6TMvwzrVKuddYc92Beu/82zcxl49cLzG4sSA7GkXNZ+iImz1qPE/cn716rHrr858wpUDhXfeRpdFzeQ225fS4pbrbRDnNtXGsBUPWbWYFevqG8ZfC6lPAI7up3hAPkXTPEZkyeRwVyAe6YKiaIVxsJTJhaicssu7BDK0rSQWpZY2uddv2pzhnaqWjJYrK2MnCbXA4FuNkM3H9xRNR72GhOC+eSe77DeoYzsRoRZLCEJlRALyWKpfXzSy67tluTRLFxOmcq4H+s/PcwS3wXXta8Cv2AmxcOB1LusQDfIBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:19:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:19:27 +0000
Date: Thu, 24 Aug 2023 11:19:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Message-ID: <ZOdm7Kr/HWrlXiux@nvidia.com>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
 <20230822142913.GB14596@pendragon.ideasonboard.com>
 <ZOaofrS7/lErEYB5@nvidia.com>
 <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f49843-547a-48d6-48ee-08dba4ad1fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YJVb+d63QtW3WYhotQ+tFwLTDdF8cCGhBg1l2O2eGxsCnumRocnR6VZS7us4TqV1PeOov/xyieHU2+oNxKk2/RgRvRSQ++GWUkOPlBhnsEDPXQcANotVozR3NW9ce85xNSaNb8Dw7kEM4EAdBk7YTFHwoTh/xvEjuaP0ggiAb2moTgF3JjrX1BFK+tYdnOfdSNORKtqSEJu5jK0kIUvapun/vXKwl/Ar78VOX6tQkUE9iY2Tlqg+XP71CK9il64DY9WLhadL3bbDKpwz9eHrPenMENSDaUVTOIlwZA6FaqwA82jy7Sprl/3bAAQE9pXRFBDUD8WDKyMGan47q08bpMc159aU8uJQ/7MpNHwWdEicpthCMkxG+wfGJCUSfLSsg0Kf8dXz85swNSlNc/Bs1w7zU1h5gsV/053ltUzi0Ug/OqDm1r8lm+lirkQT65NXehG90mUKEXmP6md6WRns0AxVZMAoNpKJxtRQUUwhi2O7dAaHS18AK5Bx4CU3aOQc0kZodaFrIoV3qrkOMP24pGzRIPjdcmNa6uM6d6QM73UNgQlUlSpYehKom7mLKtdd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(186009)(1800799009)(451199024)(2616005)(5660300002)(8936002)(4326008)(8676002)(36756003)(83380400001)(26005)(38100700002)(6666004)(66556008)(66946007)(66476007)(54906003)(6916009)(316002)(478600001)(53546011)(41300700001)(2906002)(6506007)(6512007)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VStiV3ZnSktkUE5jdXVMeGJhMVdlckwvbVdNTG4yV2dvaWxWd1FnTGtxc25W?=
 =?utf-8?B?L2hZTXUva0lqMEhWcEROY2pQdDY4aUxBVzBSME00R3VNNC9JSGhwNkM2aXlr?=
 =?utf-8?B?dkVuV21xL20vUmNwdXJSc1RGN0RoU3BsYTBnaGR5RTY2cUxBbnRRQTAwVHQ2?=
 =?utf-8?B?MVlsR2FMSFRjYWZ6RDV4RHNHQTN3S0lkMlRGV3FYV3ZJbHFvYlpmWWtPL1RC?=
 =?utf-8?B?UkdiaU1rZXNGWWpocG5xZlZ4aVZhbHVZRGxJbW5pSXVjb3I3M21jS3JhcFVi?=
 =?utf-8?B?ekVKbXAwVTNUWk5BM3VMd3RrcFd2TUVubnhiTTg1Sml3K0VIcDZPeWEvM3Ux?=
 =?utf-8?B?d2J3NXVadXorMnNzOWpGRVhuTjBUc1QxTnFkdWRuRC90ODZKdS9uWWRqVkg3?=
 =?utf-8?B?VmQyZWtBL0VOYTIzL05jZjJFempLb3NUN3h3Qks0V3lSSnR3bytPMW9pMHVQ?=
 =?utf-8?B?NFNSdWYrOXBDMzUwazIydi8zYkFaQlg5MkVEdVBIMjltZytjQ2IxSjRaL1pj?=
 =?utf-8?B?NENrcWZ4YkI3ck1FUk9ycWhuRnVlRjA4Z3JweTR6MFI0ZDU0QlJoUFA3bEJs?=
 =?utf-8?B?TGdwRWRvWnRqYWhveDZXaWlCWXRWQlFCMm5tY3Z0czNuZ0t6TUNva3hYVEdq?=
 =?utf-8?B?bllaalIrMDlwcUxXUFY0Tk1xNXozdU1aM2NZNzZ2RmU5WXArMFZtZUtDZGpi?=
 =?utf-8?B?QkFUc2hhdFNhVGh6L3hmRksrZkNOZGJCSmlXdzVOTFBGNm1SVkhGM3BGK3pO?=
 =?utf-8?B?NHRmL3JhL2lTeitXaTNIYmlCM2ZlYnU4R0o3MkRzdGNpRU9odUxGdG9Bak5r?=
 =?utf-8?B?VmxEQTMxWmlaaEpTWnl2cnoxeXJTTTRLY2FmR2MzUUNhRmlwUFROUTFiRmEy?=
 =?utf-8?B?OE1RdTNoZDZkSC9QTllvZzF4b0JDVEREWFhFZlBtai9wRnlERWJ4N3Z0dVQz?=
 =?utf-8?B?VzZjS2ZweWxqSVllRGFOYi80V1MvbkZZcUtQQjNkL1pPaGUybWxJaGVmTWRO?=
 =?utf-8?B?SjVweEZBMno1RE1MelJzeWV3MFI3RWVrWkNaVWxKNys0ZldhNmRjbVhBSFJh?=
 =?utf-8?B?TTVzZDhRZU5IRGpMQ1dQNVlvN1I0RFBhMHZ5VHlydTdNVDNoeUllWTc4U0Qr?=
 =?utf-8?B?OUdTQ0ZXTm5lUVFtQnZNQ245d2pIMzV4d3dOcTZJWUU1Rk1weFRFenhwYVpr?=
 =?utf-8?B?UWJWbXZnRU42OHhoc1hKVmlMcHU1R0ZMUVlGTWt4YVl0c01waXBYSFpKNzhI?=
 =?utf-8?B?K3VnTldrTnNSUVlFaUcySEI4UlpDbmVuaGZDRzBia29tcDhzcUFCdHZ0Vkdl?=
 =?utf-8?B?eTdKcVBRNTVFd21odU91eXI1MnRJSlMxRFFsRCtHeUpPUGJXWHNWZjNPcFNH?=
 =?utf-8?B?WHRTVmVQS25NZktiSlRiaVpWRkRPcEdWL3Y5ZkVVNmFHMUx0cFAyYUMxRDFM?=
 =?utf-8?B?eEU4QlhqRXpBbmNqaTBlcnBWU0RxZThoYkJVdmJkcm1IclhBTVZ5Qmp4UDNs?=
 =?utf-8?B?MWh3ZTZScnkwLzV5c0dRSHF1Sld0Sy9VUk0vZDlFclh4RHdTcEo4aWJadWZM?=
 =?utf-8?B?Q1NrMTZnN2NXQ01hdWZKSElOdlZFTm1BTXpma3hKbTdEbVV0bTd3c3E0Rkdj?=
 =?utf-8?B?bWU2WTViLzN5TFR5NVFBYVBJbk1Xb3l5ZkZSVUZqRkJ1V0Y3Ym80TThFMHdY?=
 =?utf-8?B?Z2VKUWtsUFF2TXUzV1FhMUx2ZkFYbnFTR2h2NW9jZjRXVE5tMTIyOTloNXh6?=
 =?utf-8?B?RVNDa21CS2RiZW9VdjNuNFdsZXNSV2x4RXB3cVhPMTBBUG96ejQ5MU5heEhK?=
 =?utf-8?B?ck1vVUpBMVFDVnpTb012dWU0c0M1YU41RDBNVzROQ0QzaWgxVFE5RzZXRFNy?=
 =?utf-8?B?MVBwcFpORzVuWWt6UDMvWmhzQnlpL2RqeVIxQWQrRWhoZlNOcFB5ME1ETTEz?=
 =?utf-8?B?Vlh3NjI3YWUrTHMvaHJFMWk3RUdRWEMwSnJZeFZicFl6WG0weFRHNFlPN2RO?=
 =?utf-8?B?cE1scjB1SEx1ZVQzMHdsYmQ3aE9iWENBSmVVMW1rNkpaVi9vcVU2cHBKSHMr?=
 =?utf-8?B?L3dGQm91R01GZ09LSGtsN1dJcHVFYlpXdEU2bWROcm50Rm5TSTVFeC9LN09D?=
 =?utf-8?Q?Ww9FjsgSr+NIKaOS4svlAaaEb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f49843-547a-48d6-48ee-08dba4ad1fc3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:19:27.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6veF1sYM6d2pGrvW0ntKJYloTHb7X9sVjaftkxnlIlBEvbbH+Frvxzgaxl1uom3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5089


On Thu, Aug 24, 2023 at 10:16:31AM +0200, Linus Walleij wrote:
> On Thu, Aug 24, 2023 at 2:47 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Tue, Aug 22, 2023 at 05:29:13PM +0300, Laurent Pinchart wrote:
> 
> > > In some (many ?) cases, the lowest effort path is to try and sneak it in
> > > without us noticing rather than "fighting it out" or "designing it out"
> > > among themselves. There are cases where this behaviour is even the
> > > consensus among vendors, as they collectively prefer keeping the design
> > > effort low and get drivers and whole new subsystems upstream without
> > > taking the community interests into account at all.
> >
> > I've begun to have the opinion that the old incentive structure in the
> > industry has fallen apart.
> (...)
> > Now we have single entities that are OEM/(Largest) Customer/OS vendor
> > and sometimes even Chip designer all rolled into one opaque box. They
> > run, and only care about, a completely proprietary stack in userspace.
> 
> I have a more optimistic view.
> 
> Maybe it depends where you look.

Yes, I didn't say, but I'm specifically looking at the
Datacenter/Cloud/Enterprise area - not Android. Arguably Android is
more classical with Google acting principally as an OS Vendor.

> For deeply embedded silicon even in datacenters, companies like
> Red Hat have pushed the vendors to work upstream because they
> don't want to carry any custom patches. Jon Masters has been
> instrumental here, requiring upstream drivers and ACPI support for
> server silicon.

The influence of the OS vendor in this space has declined
considerably. No hyperscale cloud uses Red Hat as the hypervisor
OS. Many now even provide their own in-house preferred OS for the VMs
to use.

This is what I mean, take Google Cloud as example. Their cloud side
has a propritary closed hypervisor environment. They are their own
OEM, manufacturing their own systems. They have their own hypervisor
OS and VM OS that they control. They even make some of their own
chips, and have vendors make customized off-the-shelf chips just for
them.

IMHO there are a number of surprising and new motivations that come
from this consolidation - this is not the familiar dynamic.

It pus Linux in the role of de-facto standards body without the tools
of a standards body to manage the situation.

> For drivers/accel I was under the impression that since LF is backing
> PyTorch that would be the default userspace, but I don't know how they
> stand with that as it seems CUDA-centric for accelerators, and
> admittedly I don't know what conformance would mean in that case.
> What is even the backend API for an accelerator userspace?
> CUDA and OpenCL?

Yeah, there is a big glue layer between pytorch and the actual HW.

I feel the industry settled on things like pytorch as the agreed
interop layer, and left alone, the driver layer below. So we have
CUDA/ROCm/OneAPI as all different HW stacks leading up to pytorch.

This is not even new, in HPC networking for the least 30 years we've
had MPI as the agreed interop layer and under MPI are fullly parallel
per-device stacks - with varying levels of openness. At least
classical HPC had several well funded actors who had a strong
incentive to follow open source methodologies.

AI HPC hasn't reached an incentive yet, it is too new and exciting.

> For GPIO (admittedly a smaller problem than GPU) we simply made
> a new uAPI to supercede the old one when it didn't work out.

To use Dan's example, if we have to call a mullagan on Confidential
Compute uAPIs it would be a total disaster as we would be unable to
remove the old ones, ever. Some cloud operator would build their
proprietary software stack on the old API and simply refuse to ever
change. This stuff is huge and super complicated, so the cost of
keeping two would be impractical.

I think your point of try-and-fail-fast only works if we have the
flexability to wipe out the failure. If the failure lasts forever the
cost of failing can become too great.

Jason

