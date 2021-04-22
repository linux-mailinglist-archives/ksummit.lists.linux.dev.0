Return-Path: <ksummit+bounces-91-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC9368349
	for <lists@lfdr.de>; Thu, 22 Apr 2021 17:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BE0E83E6F21
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706642FA1;
	Thu, 22 Apr 2021 15:27:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809922F83
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 15:27:04 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 272EF6145E;
	Thu, 22 Apr 2021 15:27:03 +0000 (UTC)
Date: Thu, 22 Apr 2021 11:27:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, James Morris <jmorris@namei.org>, Julia Lawall
 <julia.lawall@inria.fr>, Stephen Hemminger <stephen@networkplumber.org>,
 Roland Dreier <roland@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422112701.77224407@gandalf.local.home>
In-Reply-To: <20210422084527.u4otu3ccanckrjll@wittgenstein>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421152209.68075314@gandalf.local.home>
	<CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
	<alpine.DEB.2.22.394.2104212150230.20674@hadrien>
	<20210421132824.13a70f6c@hermes.local>
	<alpine.DEB.2.22.394.2104212233450.20674@hadrien>
	<d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
	<CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
	<YIEq8NOigBgnYKgg@linux.ibm.com>
	<20210422084527.u4otu3ccanckrjll@wittgenstein>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 10:45:27 +0200
Christian Brauner <christian.brauner@ubuntu.com> wrote:

> There's a reason why prior research into Trojan Horse contributions
> didn't just go out and try to place bugs into existing software on such
> a large scale. (The fact that even one buggy commit - accident or not -
> from their group made it into the kernel renders the whole research
> project ethically questionable.)

Perhaps this professor should publish a followup paper describing what
happens when you push malicious code and get caught. Write about the
devastation it has on one's reputation as well as the reputation of your
company. ;-)

-- Steve

