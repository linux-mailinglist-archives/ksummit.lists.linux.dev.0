Return-Path: <ksummit+bounces-677-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6E553530
	for <lists@lfdr.de>; Tue, 21 Jun 2022 17:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id A69B42E0A1B
	for <lists@lfdr.de>; Tue, 21 Jun 2022 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8875B10E3;
	Tue, 21 Jun 2022 15:05:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843110E0
	for <ksummit@lists.linux.dev>; Tue, 21 Jun 2022 15:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9270CC341C0;
	Tue, 21 Jun 2022 15:05:18 +0000 (UTC)
Date: Tue, 21 Jun 2022 11:05:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] How far to go with eBPF
Message-ID: <20220621110514.6ef174d0@rorschach.local.home>
In-Reply-To: <20220620091344.6c6499e4@rorschach.local.home>
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
	<20220620091344.6c6499e4@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jun 2022 09:13:44 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> This statement is the issue. There's not a clear line of what
> constitutes what eBPF is being used for, and worse, what is guaranteed
> to work across kernel versions.
> 
> My fear is that we will start having an expectation that pretty much
> any eBPF program will continue to work, and there's going to be a lot
> of disgruntled users when it doesn't.
> 
> Having configuration uses is one thing, enabling full device
> functionality is another. And anything that touches core interfaces
> need to be scrutinized.
> 
> If we look at where BPF came from (iptables et.al.) and having it do
> nothing more that that but for other parts of the system, it may be a
> good start. But even that could introduce dependencies of internal
> kernel implementations that could break over time. Basically, we can
> try to not break BPF programs but we really need the decree that it's
> not user API, and does not follow the "don't break user space" agenda,
> as anything that uses eBPF, is *not* user space. It's just another kind
> of kernel module.
> 
> And if an eBPF program does break, if the source of that program is not
> available, then the answer to fixing it should be "tough luck". This
> should not be a way for proprietary code to have their kernel API.

I'm currently at the Open Source Summit, and Dirk basically asked my
question almost verbatim to Linus (during the "Dirk and Linus show").

And Linus stated that there is no defined "API". It's just "do not
break user space tools", and this includes eBPF. That is, if something
that is useful in user space that breaks with an upgrade, what breaks
it either gets reverted, or a "fix" is done to make it work again.

Linus specified that when it gets to eBPF programs that do debugging or
tracing, or other really low level interactions with the kernel, then
if it breaks a user space tool that is doing this low level work, then
that's just part of the work flow (fix user space to match, it's
already dependent on the kernel implementations). He specified if you
break "real user space tools, that normal (non kernel developers) users
use" then you need to fix it, regardless if it is using eBPF or not.

This still does not address the problem. First, where's the line where a
tool becomes something for normal users?

Next, eBPF can now attach to pretty much *any* function, and modify how
that function operates (changing parameters, etc) Basically, eBPF can
do live kernel patching like changes.

If a new feature is implemented with eBPF and that eBPF feature depends
on some internal kernel implementation, where the maintainer of that
code is unaware of this new eBPF implemented feature, if they change
their code and break this, then the burden is on the maintainer to fix
that breakage, not those that implemented the eBPF feature.

This is the worry I have. Maintainers now have no control over what is
exposed to users that can become 'user API", aka break normal user
tooling, without having a clue that something now depends on the
implementation of their code.

We really need to take a step back before we let eBPF become fully
controlling of anything in the kernel. Because that's going to add a
huge burden on maintainers that do not even use eBPF.

Exposing information for consumption only is one thing, and what I
would like to have more of, but once you allow non-passive interactions
with the tracing infrastructure, it changes things where I can see a
lot of maintainers will have more push back against the former (reading
only tracing, as there's no way to keep it from making changes).

-- Steve


