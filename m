Return-Path: <ksummit+bounces-737-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730B55E517
	for <lists@lfdr.de>; Tue, 28 Jun 2022 15:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id EB82F2E0A85
	for <lists@lfdr.de>; Tue, 28 Jun 2022 13:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA6D33E4;
	Tue, 28 Jun 2022 13:53:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE433D6
	for <ksummit@lists.linux.dev>; Tue, 28 Jun 2022 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656424422; x=1687960422;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=M6uDJu2Jj+d4U7UMbeugJLGUKK0L8xsuwWnXkxLo99Q=;
  b=dZ/BHarfr6opbxDCI9b48dEdP4WXcdUtMrrfOymYjFx3ohdhsGGGecsH
   cxN2W6044muxaCmw0LaEaZy2CMfsr+26E2zOWEoKV2BNPRl+UvivASxwh
   RyV3eJt/vO5irkZUzWgQDmnFECmzGQGNFiI0s+VrdWVOBnR+m8Qb2lghQ
   GYmo2y2subtYddMPSVwQKbrz4aF17mYL57KTPIrJPYbYw8ZHBeBYNWB90
   is0oygR6D9ex6QxbewlQetqX4UpK2aOkDiXb79WEA4FBesrmyOC5zuQJc
   XDi6SooOjl4c3KbgRhnWutWkNS2cDP1MdahHZGBoPTfTljziCTg5xcLGG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="279291441"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="279291441"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 06:53:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="646920870"
Received: from mwardyn-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.49.11])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 06:53:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, ksummit@lists.linux.dev,
 ksummit-discuss@lists.linuxfoundation.org
Subject: Re: [TECH TOPIC] New userspace API for display-panel brightness
 control
In-Reply-To: <efde4273-ae38-c050-f3ed-177e175e0007@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <efde4273-ae38-c050-f3ed-177e175e0007@redhat.com>
Date: Tue, 28 Jun 2022 16:53:37 +0300
Message-ID: <87k090rj1a.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 20 Jun 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> <resend to both lists, because of confusion of which list to use>
>
> Hi All,
>
> As requested here is a copy of my LPC kernel summit track submission:
>
> Title: New userspace API for display-panel brightness control
>
> The current userspace API for brightness control offered by
> /sys/class/backlight devices has various problems:
>
> 1. There is no way to map the backlight device to a specific
> display-output / panel
>
> 2. On x86 there can be multiple firmware + direct-hw-access
> methods for controlling the backlight and the kernel may
> register multiple backlight-devices based on this which are
> all controlling the brightness for the same display-panel.
> To make things worse sometimes only one of the registered
> backlight devices actually works.
>
> 3. Controlling the brightness requires root-rights requiring
> desktop-environments to use suid-root helpers for this.
>
> 4. The scale of the brightness value is unclear, the API does
> not define if "perceived brightness" or electrical power is
> being controlled and in practice both are used without userspace
> knowing which is which.
>
> 5. The API does not define if a brightness value of 0 means off,
> or lowest brightness at which the screen is still readable
> (in a low lit room), again in practice both variants happen.

6. It's not possible to change both the gamma and the brightness in the
same KMS atomic commit. You'd want to be able to reduce brightness to
conserve power, and counter the effects of that by changing gamma to
reach a visually similar image. And you'd want to have the changes take
effect at the same time instead of reducing brightness at some frame and
change gamma at some other frame. This is pretty much impossible to do
via the sysfs interface.


BR,
Jani.

> This talk will present a proposal for a new userspace API
> which intends to address these problems in the form of a
> number of new properties for drm/kms properties on the
> drm_connector object for the display-panel.
>
> This talk will also focus on how to implement this proposal
> which brings several challenges with it:
>
> 1. The mess of having multiple interfaces to control a laptop's
> internal-panel will have to be sorted out because with the new
> API we can no longer just register multiple backlight devices
> and let userspace sort things out.
>
> 2. In various cases the drm/kms driver driving the panel
> does not control the brightness itself, but the brightness
> is controlled through some (ACPI) firmware interface such
> as the acpi_video or nvidia-wmi-ec-backlight interfaces.
>
> This introduces some challenging probe-ordering issues,
> the solution for which is not entirely clear yet, so this
> part of the talk will be actively seeking audience input
> on this topic.
>
>
> Comments:
> This is a duplicate submission with one which I submitted for
> the "LPC Refereed Track" before the "Kernel Summit 2022 CFP" posting.
>
> I recently send a RFC email about this to the relevant mailinglists:
> https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/
>
> As well as another RFC laying out some initial backlight code
> refactoring steps. As there is a bunch of technical debt which
> needs to be addressed before work on a new uAPI can even begin:
> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>
> I'm working on the refactoring now. I believe the refactoring
> is more likely to land in 5.21 then in 5.20. Let alone that
> the new uAPI on the kernel side + the mandatory userspace code
> consuming the uAPI will be ready before plumbers.
>
> IOW I expect this to still be very much in flux during Plumbers,
> so this won't be a presentation presenting only already finished
> work.
>
> Regards,
>
> Hans
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center

