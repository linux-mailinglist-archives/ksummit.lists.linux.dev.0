Return-Path: <ksummit+bounces-695-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A2558AD4
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E587A280C37
	for <lists@lfdr.de>; Thu, 23 Jun 2022 21:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDD6468F;
	Thu, 23 Jun 2022 21:36:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7914623A8
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 21:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFC5C341C0;
	Thu, 23 Jun 2022 21:36:55 +0000 (UTC)
Date: Thu, 23 Jun 2022 17:36:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 ksummit@lists.linux.dev
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] How far to go with eBPF
Message-ID: <20220623173654.4517e325@rorschach.local.home>
In-Reply-To: <CAADnVQ+4B3g9AwYp5zXXJ2c-G1L-aK69bqP8mztHGG2QgzwhaQ@mail.gmail.com>
References: <nycvar.YFH.7.76.2206151023250.14340@cbobk.fhfr.pm>
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
	<20220621110514.6ef174d0@rorschach.local.home>
	<CAO-hwJJ=9oNXA+mX9r=DwyUxbvf5-gWxAzBRCrbqdLd1LbPQdg@mail.gmail.com>
	<nycvar.YFH.7.76.2206232215020.14340@cbobk.fhfr.pm>
	<CAADnVQ+4B3g9AwYp5zXXJ2c-G1L-aK69bqP8mztHGG2QgzwhaQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jun 2022 14:23:51 -0700
Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:

> tracepoints exposed an api through cat-able and echo-able files
> that 'ubertrace' can use without any knowledge of the underlying kernel,
> without access to kernel sources, etc.
> Now please explain how bpf based tracing tools are similar?
> What exposed api do they use?

Question to you. Can eBPF provide information that normally is not
available without the eBPF program? Could there be someone that creates
a eBPF program based on internal information where that developer had
to read the kernel source to implement. But then provide this program
to other users that can now write programs based on that new
information?

Years and versions can go by, and the code that the eBPF program hasn't
changed so this works for years, without the maintainer of the attached
code even being aware of this use. Then one day that maintainer changes
the code and this eBPF program breaks for the first time in years, and
with that, it breaks all the user space applications that relied on
this.

I can see that change falling under the "broke user space" clause of
the Linux kernel and reverted.

