Return-Path: <ksummit+bounces-514-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 370EF4078EF
	for <lists@lfdr.de>; Sat, 11 Sep 2021 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 6779B1C0F83
	for <lists@lfdr.de>; Sat, 11 Sep 2021 14:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32E53FDA;
	Sat, 11 Sep 2021 14:51:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AFF3FD4
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 14:51:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 26C1C735;
	Sat, 11 Sep 2021 14:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 26C1C735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1631371863; bh=5rIlzf1tD12iVoPm7gStcCJ4G7RVoT0xWtX6cYPfUXc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DunA+Q9kZa2sD8A3fQNezjmcszUaI1an3FGfARKv0C3rmsROZOQOPlPTWqiPHbdlJ
	 7BzMtc5Cty//3wB0Q9LpX1kq0vdt3JICWoZjx6Z/yAxCqPvrzkfLGlnBZwxOVjyrlj
	 mUoM0DOUeU4HmCYx6CV4r0rP4CJkwU7af/Q7qdJxEscLP1+KVt7wlepcZoYgn5NPkP
	 l6tDapJ0OX3bH8Fg1hcJ6iK/yIeUb1eKM+ZEVgBaI0smTASOLOAvvXl4+r+s3fMwGl
	 1dBCnYh2GCFbkjvmiO48rNlSfuGd0FqOC9q/+JRPiEMCV4EIcXigyLYQQoav88OfKB
	 GguvJUGVbOB6Q==
From: Jonathan Corbet <corbet@lwn.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
In-Reply-To: <05c1591b0e3744233e78ae35ba66d2721ee6af5e.camel@HansenPartnership.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
 <YTvVKrfyMc7fKsZx@piout.net>
 <05c1591b0e3744233e78ae35ba66d2721ee6af5e.camel@HansenPartnership.com>
Date: Sat, 11 Sep 2021 08:51:01 -0600
Message-ID: <87y283np2i.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Fri, 2021-09-10 at 23:59 +0200, Alexandre Belloni wrote:
>> I think the question is not whether we want to forbid proprietary
>> user space using an API but whether we want to merge said API so the
>> license on the kernel doesn't matter much.
>
> I thought that *was* the statement I made in the last paragraph: we can
> choose whether or not to merge the enabling API into the kernel. 
> However, if we merge it we can't choose whether a proprietary user
> space takes advantage of the API.  My original reply was to the notion
> of EXPORT_USERSPACE_GPL, which I think we have no legal basis for
> enforcing without modifying the system exception.

That wasn't thinking when I pulled the idea of EXPORT_USERSPACE_GPL out
of whatever dark place it was lurking in.  The idea was, instead, to
document that if your driver is using that interface, it won't be
considered for merging into the kernel in the absence of a working,
free, user-space implementation -- should we choose to adopt such a
policy, of course.

Nobody is trying to prohibit proprietary user space, that's not the
point.

jon

