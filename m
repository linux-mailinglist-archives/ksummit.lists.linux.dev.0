Return-Path: <ksummit+bounces-152-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8253690F2
	for <lists@lfdr.de>; Fri, 23 Apr 2021 13:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 7D4D73EA102
	for <lists@lfdr.de>; Fri, 23 Apr 2021 11:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5422FA5;
	Fri, 23 Apr 2021 11:16:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069572
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 11:16:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 473CDADEF;
	Fri, 23 Apr 2021 11:16:07 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id AC07A1E37A2; Fri, 23 Apr 2021 13:16:06 +0200 (CEST)
Date: Fri, 23 Apr 2021 13:16:06 +0200
From: Jan Kara <jack@suse.cz>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423111606.GC8755@quack2.suse.cz>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
 <20210422115235.0526dabd@gandalf.local.home>
 <20210422161340.GB8755@quack2.suse.cz>
 <yq135vis349.fsf@ca-mkp.ca.oracle.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq135vis349.fsf@ca-mkp.ca.oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu 22-04-21 13:08:09, Martin K. Petersen wrote:
> 
> Jan,
> 
> > Is it that hard to improve quilt?
> 
> Now that we have tighter integration between the various components of
> our infrastructure, I wonder if we should reconsider the patch
> submission process?
> 
> Instead of putting the burden on the submitter to pick the right 20
> mailing lists to CC: and accommodate 100 developers and maintainers with
> individual delivery preferences, why not let the k.org infrastructure
> automate that aspect?
> 
> Have a patch ingress email address that runs get_maintainer.pl to figure
> out who to reach out to. And then everybody with a kernel.org account
> can twiddle their preferences wrt. whether to receive the whole series,
> only patches that touch files they are responsible for, opt not to
> receive individual mails but only the relevant mailing list copy,
> whether to receive stable backport notifications, etc.
> 
> That would substantially lower the barrier of entry for patch
> submitters. More work for Konstantin, obviously. And potentially some
> transitional grievances for most of the rest of us based on our
> individual workflows and preferences.
> 
> Just an idea, I know it's a bit controversial. However, there seems to
> be no shortage of problems originating in the patch mail preparation and
> sending department. Seems like a bigger barrier for some than developing
> the actual patch.
> 
> We could even consider supporting receiving and disseminating git
> bundles on the ingress. That would help overcome the many problems with
> corporate email servers vs. git send-email. A ton of problems are
> introduced as developers copy and paste things from their corporate
> email to GMail, etc. Seems like our backend tooling could help alleviate
> some of those pains without completely wrecking the mail-based flow we
> maintainers are comfortable with...

I agree this would be a nicer solution and I think something like this is
eventual Konstantin's goal. So hopefully we'll get there once :)

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

