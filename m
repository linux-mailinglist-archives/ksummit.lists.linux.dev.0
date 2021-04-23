Return-Path: <ksummit+bounces-153-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F736928A
	for <lists@lfdr.de>; Fri, 23 Apr 2021 14:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 01D091C819D
	for <lists@lfdr.de>; Fri, 23 Apr 2021 12:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A273E2FA5;
	Fri, 23 Apr 2021 12:58:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959412F83
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 12:58:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CC6F611AE;
	Fri, 23 Apr 2021 12:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619182683;
	bh=L84qg3MsMHBWWa9ZxpGbrGa+eSKcJtHUOP4HSyHKPrE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ETrBZxptC3+7P72JBTkErMG+V+Vn9nyuXTGZkR5sI7zeZt35pmaK4EjQief5drmsy
	 zU8p30ChcefDgSnIwfIGnslpmbvPDly3lSU9LZXsnOGhWuRrmMlak5dqU6MU04rLdR
	 kcvD/ai8ldOLFDOCDH1unaXMEsABAzhRBlXZn0Tz5uyC8+yL3BjODNv7YVBd8Js8bw
	 5QTYYGm64CVz2DB4UI/LPVuJ9kvNXKUDTWpI+OZ3J0/jD13HAZ79hXj7UFHplo53b1
	 bcFSr8Fa0vFX9qLPyQijbjPDmKdUYDk2e6R7lNFs0VZziNuDTwXAwPQXJa37NIct+k
	 yFqmq2rsloNdg==
Date: Fri, 23 Apr 2021 14:57:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Steven Rostedt
 <rostedt@goodmis.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Shuah Khan
 <skhan@linuxfoundation.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423145758.4c6c144d@coco.lan>
In-Reply-To: <20210423111606.GC8755@quack2.suse.cz>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
	<a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
	<dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
	<20210422115235.0526dabd@gandalf.local.home>
	<20210422161340.GB8755@quack2.suse.cz>
	<yq135vis349.fsf@ca-mkp.ca.oracle.com>
	<20210423111606.GC8755@quack2.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 23 Apr 2021 13:16:06 +0200
Jan Kara <jack@suse.cz> escreveu:

> On Thu 22-04-21 13:08:09, Martin K. Petersen wrote:
> > 
> > Jan,
> >   
> > > Is it that hard to improve quilt?  
> > 
> > Now that we have tighter integration between the various components of
> > our infrastructure, I wonder if we should reconsider the patch
> > submission process?
> > 
> > Instead of putting the burden on the submitter to pick the right 20
> > mailing lists to CC: and accommodate 100 developers and maintainers with
> > individual delivery preferences, why not let the k.org infrastructure
> > automate that aspect?
> > 
> > Have a patch ingress email address that runs get_maintainer.pl to figure
> > out who to reach out to. And then everybody with a kernel.org account
> > can twiddle their preferences wrt. whether to receive the whole series,
> > only patches that touch files they are responsible for, opt not to
> > receive individual mails but only the relevant mailing list copy,
> > whether to receive stable backport notifications, etc.
> > 
> > That would substantially lower the barrier of entry for patch
> > submitters. More work for Konstantin, obviously. And potentially some
> > transitional grievances for most of the rest of us based on our
> > individual workflows and preferences.
> > 
> > Just an idea, I know it's a bit controversial. However, there seems to
> > be no shortage of problems originating in the patch mail preparation and
> > sending department. Seems like a bigger barrier for some than developing
> > the actual patch.
> > 
> > We could even consider supporting receiving and disseminating git
> > bundles on the ingress. That would help overcome the many problems with
> > corporate email servers vs. git send-email. A ton of problems are
> > introduced as developers copy and paste things from their corporate
> > email to GMail, etc. Seems like our backend tooling could help alleviate
> > some of those pains without completely wrecking the mail-based flow we
> > maintainers are comfortable with...  
> 
> I agree this would be a nicer solution and I think something like this is
> eventual Konstantin's goal. So hopefully we'll get there once :)

The idea is nice, but, for this to work, the reply-to address should point
to some bot at kernel.org infra, as all replies to a given patch (or cover)
should be replied to everyone that it was c/c on the original e-mail, plus
the patch submitter.

Thanks,
Mauro

