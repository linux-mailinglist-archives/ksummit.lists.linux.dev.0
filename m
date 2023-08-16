Return-Path: <ksummit+bounces-994-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14077E441
	for <lists@lfdr.de>; Wed, 16 Aug 2023 16:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72CC91C2111A
	for <lists@lfdr.de>; Wed, 16 Aug 2023 14:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D469134B1;
	Wed, 16 Aug 2023 14:55:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64410957
	for <ksummit@lists.linux.dev>; Wed, 16 Aug 2023 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A157C433C8;
	Wed, 16 Aug 2023 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692197741;
	bh=7NA+YI9GjTwgHI/a48nfbZSfVhpe8E7WblfjYClTu6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jc7NUDuUtc5rRJDv+lOds/tN3eBACqtFqoJjGUjE9CUhG645Vjo5PR1JfpI/75Tmu
	 JHvIybECE1vwdeaEkDoBRZRo4Rqj1ewREM+g2PeENsT0zUNMqLfmdi0ROITEdFqnDy
	 SkwVgbXAocRgkr0NXLulq117NOdpYxpj7DokHZmY=
Date: Wed, 16 Aug 2023 16:55:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2023081641-unstitch-kangaroo-a2c1@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
 <20230815183120.0c92a759@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815183120.0c92a759@gandalf.local.home>

On Tue, Aug 15, 2023 at 06:31:20PM -0400, Steven Rostedt wrote:
> On Wed, 16 Aug 2023 00:13:56 +0200 (CEST)
> Jiri Kosina <jikos@kernel.org> wrote:
> 
> > > The huge majority of Linux use in the world is Android, everything else
> > > is a rounding error.   
> > 
> > Sorry, but in my view this is a slight oversimplification.
> 
> I agree. And that's just taking in "numbers". What about impact. If there's
> a security flaw in an android phone, it opens up each individual for an
> attack, but it usually requires an attacker to hit them individually.
> 
> But if an enterprise is hit. All it takes is to go after one server, and
> you have access to thousands of users and their private data.
> 
> It's not just the number of installations that count.

Very true, but as an individual, we regard the private data in our
phones usually more important than the data stored in corporate systems :)

Anyway, my whole point here is that there are huge swaths of users of
Linux, the majority in quantity (not judging quality), that are now
doing the right thing here by taking all known fixes into their kernel
trees.  It's only a small (in absolute numbers, not importance, I'm not
judging importance as everyone is more important than everyone else,
like always), number that are not doing this and asking for us to give
them access to a tiny feed of fixes instead so that they can have a
false sense of security.

Please, let's work on fixing that false sense of security.  It's wrong,
and our users deserve better as we (the community) ARE doing all of the
fixing the best we can, but not all of our users seem to be able to take
advantage of this due to the "policy decisions" of others outside of our
community.

And note, those "policy decisions of companies" are now known by
governments to be incorrect, and soon will be made illegal in many
countries, so we are on the right side here.

Together we were able to solve the "impossible" problem of Android
kernel security.  Now that that windmill is semi-successfully conquered
despite many who thought it never could be, why can't we help other
users of our product to do the same?  If not, we run the risk of having
Linux be blamed for bad security, when in reality, it's the policy of
companies not taking advantage of what we are providing them, a nuance
that Linux users will never really understand, nor should they have to.

Let's fix this properly please, access to the security@k.o reports will
do nothing to solve the root issue, and only paper it over for a few
more years.

thanks,

greg k-h

