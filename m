Return-Path: <ksummit+bounces-671-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11C551AA5
	for <lists@lfdr.de>; Mon, 20 Jun 2022 15:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45FB280BF1
	for <lists@lfdr.de>; Mon, 20 Jun 2022 13:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A2681E;
	Mon, 20 Jun 2022 13:13:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C427E5
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 13:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1835FC3411B;
	Mon, 20 Jun 2022 13:13:46 +0000 (UTC)
Date: Mon, 20 Jun 2022 09:13:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] How far to go with eBPF
Message-ID: <20220620091344.6c6499e4@rorschach.local.home>
In-Reply-To: <CAO-hwJ+DJGYzKeGd8q7ma3L_qfd=phxczyfPqPnoz-DV9By_Cg@mail.gmail.com>
References: <nycvar.YFH.7.76.2206151023250.14340@cbobk.fhfr.pm>
	<20220615170407.ycbkgw5rofidkh7x@quack3.lan>
	<87h74lvnyf.fsf@meer.lwn.net>
	<20220615174601.GX1790663@paulmck-ThinkPad-P17-Gen-1>
	<nycvar.YFH.7.76.2206152022550.14340@cbobk.fhfr.pm>
	<20220616122634.6e11e58c@gandalf.local.home>
	<bbb46f66bb8518e90030fe97a1225adf178654d1.camel@HansenPartnership.com>
	<20220616125128.68151432@gandalf.local.home>
	<a522bfa4241eb263e354ebbb293b0d629dd2e026.camel@HansenPartnership.com>
	<nycvar.YFH.7.76.2206170947520.14340@cbobk.fhfr.pm>
	<20220617103050.2almimus5hjcifxl@quack3.lan>
	<CAO-hwJJxCteD_BHZTeqQ1f7gWOHoj+05qP8bmFsRYVfMc_3FxQ@mail.gmail.com>
	<dc6ca88d-d1ef-a1ab-dbef-e9338467271d@redhat.com>
	<CAO-hwJ+DJGYzKeGd8q7ma3L_qfd=phxczyfPqPnoz-DV9By_Cg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


[ Switched over to ksummit@lists.linux.dev ]

On Fri, 17 Jun 2022 13:25:04 +0200
Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:

> > I think you need to clarify here that you mean changing some settings
> > on the device through e.g. a HID feature report which would require
> > a sysfs-attribute or kernel-module-parameters without ePBF and you want
> > to avoid adding more and more sysfs-attributes / kernel-module-parameters?  
> 
> Yep yep :)

And that is perfectly acceptable, and something I would support.

> 
> >
> > At least I think this is what you are trying to say, and I think that
> > without some clarification this is not what most kernel-devs will
> > understand here.  

This statement is the issue. There's not a clear line of what
constitutes what eBPF is being used for, and worse, what is guaranteed
to work across kernel versions.

My fear is that we will start having an expectation that pretty much
any eBPF program will continue to work, and there's going to be a lot
of disgruntled users when it doesn't.

Having configuration uses is one thing, enabling full device
functionality is another. And anything that touches core interfaces
need to be scrutinized.

If we look at where BPF came from (iptables et.al.) and having it do
nothing more that that but for other parts of the system, it may be a
good start. But even that could introduce dependencies of internal
kernel implementations that could break over time. Basically, we can
try to not break BPF programs but we really need the decree that it's
not user API, and does not follow the "don't break user space" agenda,
as anything that uses eBPF, is *not* user space. It's just another kind
of kernel module.

And if an eBPF program does break, if the source of that program is not
available, then the answer to fixing it should be "tough luck". This
should not be a way for proprietary code to have their kernel API.

-- Steve


