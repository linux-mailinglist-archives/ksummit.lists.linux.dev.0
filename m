Return-Path: <ksummit+bounces-142-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF88368DFF
	for <lists@lfdr.de>; Fri, 23 Apr 2021 09:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CCF0E1C6256
	for <lists@lfdr.de>; Fri, 23 Apr 2021 07:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635A22FA5;
	Fri, 23 Apr 2021 07:34:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtprelay.hostedemail.com (smtprelay0028.hostedemail.com [216.40.44.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40F70
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 07:34:20 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id AEF16181CB153
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 00:26:16 +0000 (UTC)
Received: from omf11.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id 944121800803F;
	Fri, 23 Apr 2021 00:26:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 6434320A294;
	Fri, 23 Apr 2021 00:26:09 +0000 (UTC)
Message-ID: <e3325ada985cf22b3a1d5300ef3c6ab7a9fdea8f.camel@perches.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: Joe Perches <joe@perches.com>
To: Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt
 <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, 
 Leon Romanovsky <leon@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>,  ksummit@lists.linux.dev
Date: Thu, 22 Apr 2021 17:26:08 -0700
In-Reply-To: <87tunyvt8h.ffs@nanos.tec.linutronix.de>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk>
	 <YIFx/iorjncjslob@linux.ibm.com> <20210422132339.GF4572@sirena.org.uk>
	 <20210422111939.0c555039@gandalf.local.home>
	 <875z0exbiq.ffs@nanos.tec.linutronix.de>
	 <20210422173637.67354c26@gandalf.local.home>
	 <87tunyvt8h.ffs@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6434320A294
X-Spam-Status: No, score=0.10
X-Stat-Signature: 4993ng1du1wcjtuxydfje4e88ojjb4hc
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/AqMf09iuNLJn8pb05hYfw9Fd6QAoXqAU=
X-HE-Tag: 1619137569-214155

On Fri, 2021-04-23 at 00:39 +0200, Thomas Gleixner wrote:
> > Another approach is to have quilt just save to a mbox, and modify that, and
> > use another mail program to send that mbox.

Which, if the cc list is long, won't let the cover letter be accepted
and forwarded by some mailing lists.

There are no great options for some treewide patch cases.

A possible option would be to bcc individuals on the cover letter, and
cc all the mailing lists, but in that case if an individual replies,
only the lists would get the replies.



