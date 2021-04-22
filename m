Return-Path: <ksummit+bounces-106-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE40368487
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 02B651C633F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23552FA0;
	Thu, 22 Apr 2021 16:13:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961EA70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:13:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 854A4B179;
	Thu, 22 Apr 2021 16:13:41 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 277301E37A2; Thu, 22 Apr 2021 18:13:40 +0200 (CEST)
Date: Thu, 22 Apr 2021 18:13:40 +0200
From: Jan Kara <jack@suse.cz>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422161340.GB8755@quack2.suse.cz>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
 <20210422115235.0526dabd@gandalf.local.home>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422115235.0526dabd@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu 22-04-21 11:52:35, Steven Rostedt wrote:
> On Thu, 22 Apr 2021 08:48:21 -0700
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
> > [...]
> > >    2. Improving the requirement for bug fixes and large series, like
> > > cover letters to everyone, adding fixes: tag and clear explanation.  
> > 
> > Just on this one, can we get the mailing list to help now we're moving
> > to a new infrastructure?  I was already thinking of asking if it could
> > reject email with html parts rather than simply losing it, but perhaps
> > it could reject threaded submissions where the cover letter isn't
> > correctly cc'd?  I know that's a big ask because there has to be an
> > easy way to recognize them (heuristics on the PATCH tag?) and a way to
> > recognize missing cc's (perhaps simply that someone cc'd on the
> > threaded [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)
> 
> Unfortunately, this breaks all quilt users, as quilt does not support this.

Is it that hard to improve quilt?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

