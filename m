Return-Path: <ksummit+bounces-278-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC93BE38F
	for <lists@lfdr.de>; Wed,  7 Jul 2021 09:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4ADEB3E1094
	for <lists@lfdr.de>; Wed,  7 Jul 2021 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE56E2FAD;
	Wed,  7 Jul 2021 07:28:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9930C70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 07:28:44 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A7DzLsaDh8pUH7rvlHemo55DYdb4zR+YMi2TD?=
 =?us-ascii?q?sHocdfU1SKOlfqWV98jzuiWbtN98YhAdcLK7Scq9qALnlaKdiLN5Vd3OYOCMgh?=
 =?us-ascii?q?rLEGgN1/qH/xTQXwH46+5BxeNBXsFFebrN5IFB/KPH3DU=3D?=
X-IronPort-AV: E=Sophos;i="5.83,331,1616454000"; 
   d="scan'208";a="518702531"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 09:27:32 +0200
Date: Wed, 7 Jul 2021 09:27:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc: Linus Walleij <linus.walleij@linaro.org>, 
    Roland Dreier <roland@kernel.org>, 
    Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
In-Reply-To: <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
Message-ID: <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com> <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com> <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com> <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 7 Jul 2021, Laurent Pinchart wrote:

> On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier wrote:
> >
> > > One area I see where Rust could make a big improvement for drivers is
> > > in using RAII for error paths.  Drivers often have a lot of code like
> > >
> > >     if (something())
> > >         return err;
> > >
> > >     if (something_else())
> > >         goto undo_something;
> > >
> > >     if (a_third_thing())
> > >         goto undo_two_things;
> > >
> > > and so on, which is difficult to get right in the first place and even
> > > harder to keep correct in the face of changes.
> >
> > Yes.
> >
> > > "devres" / devm_xxx was an attempt to deal with this in C, but it only
> > > solves some cases of this and has not received a lot of adoption (we
> > > can argue about the reasons).
> >
> > Really? From my point of view that is adopted all over the map.
> > I add new users all the time and use it as much as I can when
> > writing new drivers.
> >
> > $ git grep devm_  | wc -l
> > 26112
> >
> > Dmitry in the input subsystem even insist to use it for e.g. powering
> > down and disabling regulators on remove(), like recently in
> > drivers/input/touchscreen/cy8ctma140.c
> >
> > /* Called from the registered devm action */
> > static void cy8ctma140_power_off_action(void *d)
> > {
> >         struct cy8ctma140 *ts = d;
> >
> >         cy8ctma140_power_down(ts);
> > }
> > (...)
> > error = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
> > if (error) {
> >         dev_err(dev, "failed to install power off handler\n");
> >         return error;
> > }
> >
> > I think it's a formidable success, people just need to learn to do it more.
>
> devres is interesting and has good use cases, but the devm_k*alloc() are
> a nightmare. They're used through drivers without any consideration of
> life time management of the allocated memory, to allocate data
> structures that can be accessed in userspace-controlled code paths.
> Open a device node, keep it open, unplug the device, close the device
> node, and in many cases you'll find that the kernel can crash :-( When
> the first line of the probe function of a driver that exposes a chardev
> if a devm_kzalloc(), it's usually a sign that something is wrong.

Where should the free have been?  Will Rust help in this case?  Will it
result in a memory leak?

julia

>
> I wonder if we could also benefit from the gcc cleanup attribute
> (https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-cleanup-variable-attribute).
> I don't know if it's supported by the other compilers we care about
> though.
>
> > But if an easier path to learn better behaviours is to shuffle the whole
> > chessboard and replace it with drivers written in Rust, I don't know?
> > Maybe?
>
> --
> Regards,
>
> Laurent Pinchart
>
>

