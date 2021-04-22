Return-Path: <ksummit+bounces-30-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA18367957
	for <lists@lfdr.de>; Thu, 22 Apr 2021 07:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7B9C71C2B71
	for <lists@lfdr.de>; Thu, 22 Apr 2021 05:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFBD2FA2;
	Thu, 22 Apr 2021 05:33:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtprelay.hostedemail.com (smtprelay0162.hostedemail.com [216.40.44.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF22F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 05:33:57 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id C7006181C5C28
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 03:04:26 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id DD4481806CE17;
	Thu, 22 Apr 2021 03:04:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 1AB4F18A600;
	Thu, 22 Apr 2021 03:04:18 +0000 (UTC)
Message-ID: <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
From: Joe Perches <joe@perches.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley
	 <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev
Date: Wed, 21 Apr 2021 20:04:17 -0700
In-Reply-To: <yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com>
References: 
	<afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	 <yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 1AB4F18A600
X-Spam-Status: No, score=0.10
X-Stat-Signature: q1hqbin18popqsnypfxb1y5jokhyd5er
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+6DKNGYKOlEwr+3DowDR8mzIEshMtjR74=
X-HE-Tag: 1619060658-301195

On Wed, 2021-04-21 at 22:05 -0400, Martin K. Petersen wrote:
> James,
> 
> > Our policy in SCSI for a long time has been no trivial patches
> > accepted to maintained drivers,
> 
> I'm afraid that ship sailed years ago. I am merging a ton of trivial
> patches in SCSI.

True and thank you.

Perhaps the primary thing that James' email shows is that he's not
actively watching drivers/scsi/ git tree changes very much.

And I believe James is referring to whitespace style trivial patches.

> The reality is that not merging trivial patches is a losing battle. The
> various static checkers appear to develop defect detection parity and
> gcc and LLVM get more picky with every release.

True, but perhaps most of the pickiness can be mitigated by moving
various warnings to W=2 or W=3.

> Consequently, if I don't
> apply a trivial patch, I'll end up having a variant of the same fix show
> up in my inbox weekly until the end of time. I have no choice but to
> apply.
> 
> A compounding problem is that many individual driver developers are
> overwhelmed by the constant flurry of trivial patches and therefore
> ignore them.

I believe it's more like some or most individual driver developers
do not actually actively maintain their drivers and the MAINTAINER
section for various drivers are more like vanity or historical lists.

It's true when the driver is first submitted and under review, many
driver developers do take and apply feedback, but the period for
most developers to actively track changes ends when the driver is
accepted into the mainline tree.

> So from a practical perspective there is very little
> difference between maintained and unmaintained drivers in the trivial
> patch department.



