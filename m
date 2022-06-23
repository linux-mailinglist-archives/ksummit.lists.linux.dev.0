Return-Path: <ksummit+bounces-693-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0895C5589DE
	for <lists@lfdr.de>; Thu, 23 Jun 2022 22:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5BC6280C2E
	for <lists@lfdr.de>; Thu, 23 Jun 2022 20:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E72233E8;
	Thu, 23 Jun 2022 20:15:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E7257E
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 20:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B8AC341C0;
	Thu, 23 Jun 2022 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656015320;
	bh=Q5RZhhOqII4x3BBl1GYvDNAVAz74a17H1hESTZ/mlKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J+msDlF3eST+CoIY5QxGAkksGiqHqgP9z+j4S7eVuDPwlN6Qwetbr73CaNjZfC5NR
	 f3DKXLDtMZbtirF/7XkgTSVCW3iYrDcPEC0Xx2bOoXVzlPCxruyj8vGCpDTVlBjNlh
	 Sxfgl/R/SFs3gLO6PIoHdJ59e1NN8i6rOFRtMufN6QoPvo3YXS6uK2WYeGc4ye6HVU
	 Ju59wF0X5YW915t15ueoHMl1EzpSdzpCoX1plpQjUP1IHohm/fsbchSSeQlM8noWC8
	 F3vqqyqctLMKiNX+hA8S6MlBHG6qScc3OkQL0K39chArZteMEhdVGeY0JA0U0JL/Ha
	 nW1jtSJz3//AA==
Date: Thu, 23 Jun 2022 22:15:17 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc: Steven Rostedt <rostedt@goodmis.org>, Hans de Goede <hdegoede@redhat.com>, 
    ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] How far to go with eBPF
In-Reply-To: <CAO-hwJJ=9oNXA+mX9r=DwyUxbvf5-gWxAzBRCrbqdLd1LbPQdg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2206232215020.14340@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2206151023250.14340@cbobk.fhfr.pm> <20220615170407.ycbkgw5rofidkh7x@quack3.lan> <87h74lvnyf.fsf@meer.lwn.net> <20220615174601.GX1790663@paulmck-ThinkPad-P17-Gen-1> <nycvar.YFH.7.76.2206152022550.14340@cbobk.fhfr.pm>
 <20220616122634.6e11e58c@gandalf.local.home> <bbb46f66bb8518e90030fe97a1225adf178654d1.camel@HansenPartnership.com> <20220616125128.68151432@gandalf.local.home> <a522bfa4241eb263e354ebbb293b0d629dd2e026.camel@HansenPartnership.com>
 <nycvar.YFH.7.76.2206170947520.14340@cbobk.fhfr.pm> <20220617103050.2almimus5hjcifxl@quack3.lan> <CAO-hwJJxCteD_BHZTeqQ1f7gWOHoj+05qP8bmFsRYVfMc_3FxQ@mail.gmail.com> <dc6ca88d-d1ef-a1ab-dbef-e9338467271d@redhat.com> <CAO-hwJ+DJGYzKeGd8q7ma3L_qfd=phxczyfPqPnoz-DV9By_Cg@mail.gmail.com>
 <20220620091344.6c6499e4@rorschach.local.home> <20220621110514.6ef174d0@rorschach.local.home> <CAO-hwJJ=9oNXA+mX9r=DwyUxbvf5-gWxAzBRCrbqdLd1LbPQdg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Jun 2022, Benjamin Tissoires wrote:

> > I'm currently at the Open Source Summit, and Dirk basically asked my
> > question almost verbatim to Linus (during the "Dirk and Linus show").
> 
> Heh, interesting :)

I guess that also sort of underlines the point that this discussion is 
relevant :)

> Hmm, OK, but I am not sure we are all talking about the same thing here.
> 
> For real user space applications using eBPF, AFAICT, today we have 
> cgroups and network filtering. And for those 2 applications, given that 
> there is a well defined eBPF API, it wouldn't surprise me that 
> maintainers should take care of the user space breakage.
> 
> However, if I decide to attach a random BPF program to random functions 
> in the kernel without any involvement in the kernel, and use it to get 
> some metrics, how can we consider this to be plain debugging or an 
> actual user space application (assuming I share it with the rest of the 
> world)?
> 
> So IMO, we can not assume that any user space application relying on 
> eBPF should never break if that application is hooking to random 
> functions in the kernel. If that user space application is using a well 
> defined (not-an-)API, then yes, this is something maintainers should be 
> aware of.

And we have been exactly here with traceevents/tracepoints, as far as I 
can tell.

It was introduced mostly for debugging and profiling purposes. Then some 
random Joe Developer wrote his 'ubertrace' tracing tool that had hard 
dependency on format of some of those, and they they changed, this 
publicly available tool broke. I don't see how eBPF makes this in 
principle different, and that's exactly why I brought this up. Because 
every maintainer is potentially involved/affected, even those who have no 
idea whatsoever yet what eBPF is.

> > This still does not address the problem. First, where's the line where a
> > tool becomes something for normal users?
> 
> I thought this was the initial topic that Jiri raised, and why we need
> to have this discussion :)

Absolutely, yes.

Thanks,

-- 
Jiri Kosina
SUSE Labs

