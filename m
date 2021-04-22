Return-Path: <ksummit+bounces-113-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B410368576
	for <lists@lfdr.de>; Thu, 22 Apr 2021 19:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2CA6A3E7951
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D052FA0;
	Thu, 22 Apr 2021 17:04:50 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259992F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 17:04:49 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0DAE4613CC;
	Thu, 22 Apr 2021 17:04:47 +0000 (UTC)
Date: Thu, 22 Apr 2021 13:04:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jan Kara <jack@suse.cz>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422130446.1d8653cb@gandalf.local.home>
In-Reply-To: <20210422161340.GB8755@quack2.suse.cz>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
	<a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
	<dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
	<20210422115235.0526dabd@gandalf.local.home>
	<20210422161340.GB8755@quack2.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 18:13:40 +0200
Jan Kara <jack@suse.cz> wrote:

> > Unfortunately, this breaks all quilt users, as quilt does not support this.  
> 
> Is it that hard to improve quilt?

I've toyed with fixing this, and almost had it working once. I just never
had time to get it fully working.

But no, it's not hard. But it does require a good understanding of both
bash script and Perl ;-)

-- Steve

