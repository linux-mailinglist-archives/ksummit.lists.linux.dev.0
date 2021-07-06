Return-Path: <ksummit+bounces-273-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6D3BDF2D
	for <lists@lfdr.de>; Wed,  7 Jul 2021 00:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 69DE61C0EBA
	for <lists@lfdr.de>; Tue,  6 Jul 2021 22:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB722FAD;
	Tue,  6 Jul 2021 22:00:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E51A168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 22:00:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7FFB466;
	Wed,  7 Jul 2021 00:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625608847;
	bh=P5sqlu4LSHfGce1oJnwlU2St5rbDH3pLxOe+kg41KWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuX3+ujg57JOr32OuAMXdiCKqJVO2AVn44pmZxRiAe0JzBdiPqeaIVvTgmyayi4O7
	 Fgek2KeUvqDVOsgMYPtrUzYUM6c9ihFQhq76kmEL0nlH6SR+u1BsHvGS3mlLXfsr+c
	 Hzk7OLzinXhE3iZI0l7pAKRsaeosjw39oalHISBE=
Date: Wed, 7 Jul 2021 01:00:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>

On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier wrote:
> 
> > One area I see where Rust could make a big improvement for drivers is
> > in using RAII for error paths.  Drivers often have a lot of code like
> >
> >     if (something())
> >         return err;
> >
> >     if (something_else())
> >         goto undo_something;
> >
> >     if (a_third_thing())
> >         goto undo_two_things;
> >
> > and so on, which is difficult to get right in the first place and even
> > harder to keep correct in the face of changes.
> 
> Yes.
> 
> > "devres" / devm_xxx was an attempt to deal with this in C, but it only
> > solves some cases of this and has not received a lot of adoption (we
> > can argue about the reasons).
> 
> Really? From my point of view that is adopted all over the map.
> I add new users all the time and use it as much as I can when
> writing new drivers.
> 
> $ git grep devm_  | wc -l
> 26112
> 
> Dmitry in the input subsystem even insist to use it for e.g. powering
> down and disabling regulators on remove(), like recently in
> drivers/input/touchscreen/cy8ctma140.c
> 
> /* Called from the registered devm action */
> static void cy8ctma140_power_off_action(void *d)
> {
>         struct cy8ctma140 *ts = d;
> 
>         cy8ctma140_power_down(ts);
> }
> (...)
> error = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
> if (error) {
>         dev_err(dev, "failed to install power off handler\n");
>         return error;
> }
> 
> I think it's a formidable success, people just need to learn to do it more.

devres is interesting and has good use cases, but the devm_k*alloc() are
a nightmare. They're used through drivers without any consideration of
life time management of the allocated memory, to allocate data
structures that can be accessed in userspace-controlled code paths.
Open a device node, keep it open, unplug the device, close the device
node, and in many cases you'll find that the kernel can crash :-( When
the first line of the probe function of a driver that exposes a chardev
if a devm_kzalloc(), it's usually a sign that something is wrong.

I wonder if we could also benefit from the gcc cleanup attribute
(https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-cleanup-variable-attribute).
I don't know if it's supported by the other compilers we care about
though.

> But if an easier path to learn better behaviours is to shuffle the whole
> chessboard and replace it with drivers written in Rust, I don't know?
> Maybe?

-- 
Regards,

Laurent Pinchart

