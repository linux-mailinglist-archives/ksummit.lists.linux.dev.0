Return-Path: <ksummit+bounces-754-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2433658EBE2
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D44DB280A87
	for <lists@lfdr.de>; Wed, 10 Aug 2022 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713AE17EE;
	Wed, 10 Aug 2022 12:19:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB217D3
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 12:19:15 +0000 (UTC)
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 882FE687; Wed, 10 Aug 2022 07:12:41 -0500 (CDT)
Date: Wed, 10 Aug 2022 07:12:41 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <20220810121241.GA6146@mail.hallyn.com>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
 <YvObmmmLiX6z8eA3@google.com>
 <20220810120450.GT3460@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810120450.GT3460@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Aug 10, 2022 at 03:04:50PM +0300, Dan Carpenter wrote:
> On Wed, Aug 10, 2022 at 12:50:50PM +0100, Lee Jones wrote:
> >
> > I am presently plagued with reviews for lots of files that I've
> > touched over the years.  Even if the changes were trivial.
> > 
> > Or is this just an education point?
> 
> Education is not the answer.
> 
> We've got thousands of devs and no one can keep track of everyone and
> their motives.
> 
> When I send patches, there are few people that I know what they're about
> and I manually delete them.  I also know which mailing lists those
> people read so normally they're going to get the email even if they're
> not on the CC list.
> 
> Other times, I wonder why maintainers are still on the CC list if they
> haven't been active in years.  But I'm not going to manually remove
> them.  It's worse to get chewed out for not CCing someone than for
> including them.

Huh.  Chewed out for including them?  I had always thought that was *the*
point of MAINTAINERS.

Now, with lei (<3), MAINTAINERS becomes less important, as I can search
for the files/functions I'm interested in, and until someone starts
sending spam including patch hunks just to get pulled into such searches
that's more reliable than my shoddy spam filtering attempts on personal
email :)  The latter dropping important emails and letting through spam...

> The one split which is quite confusing to me is the netdev vs wireless
> split.  For wireless patches, I generelly delete all the netdev
> maintainers.  Some people I'm not sure what they care about so I leave
> them.
> 
> regards,
> dan carpenter

