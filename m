Return-Path: <ksummit+bounces-1013-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB777FAD3
	for <lists@lfdr.de>; Thu, 17 Aug 2023 17:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3032282017
	for <lists@lfdr.de>; Thu, 17 Aug 2023 15:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D658154AD;
	Thu, 17 Aug 2023 15:33:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F514F87
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 15:33:29 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bc9d16c317so3207a34.1
        for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20221208.gappssmtp.com; s=20221208; t=1692286409; x=1692891209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pyEXG+1/s2Q+kaBxBYDRBm2LeiLqV8S+e4xYs3yyGz0=;
        b=1+q5iD3pZqEMblsH95vjiC/2y2QTpYZev9yLtUfwxB/ZUWYj6VW7rZd/FwacbWN0nq
         eHrSPNKKpivzT8fOtF1Ko1JnSaAtliqg8QCDuCh7fy/ngGDN2cI00BJR7x086pMc227D
         L9cRk6fHL2zo/9fE8MNjt5h9+SIq6ploBVnlk95tsLLXzEzrAm4gy7QT4wwJYh2otBBW
         WIZNJUiq78NYtKZPNI0XvhaV7JAjeO3AVyUy0KUHVaxt68VA43lmfEsJG4GIWuZPOkpk
         lxQXfP05UpxiUjfHraUCJaC9kxksD3cMQjAU1kV9M++jShNxzVjhxX7/HA6cNaUHDRTS
         AHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692286409; x=1692891209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyEXG+1/s2Q+kaBxBYDRBm2LeiLqV8S+e4xYs3yyGz0=;
        b=GJqtydEJYdBZ3SNwG2i55fYmCznt7cSb0HpOAJcUC+FP9lOoodjHs+u1yu+0O067EL
         KHFToMoK5pgyV+BdR98PoiDxm0CHee6jgUYIQlS4WQxZ671HTV+y6j58lgREsn78dtoi
         ammBUznF2E3ZGYyQBxGoV/qKxhZmX2rLQXr+kJneLdJO+eqTpq/baJVcULm/IeQXqgwc
         3VNxMqlPS2+JxczVVKmpt5lTMFKCL2vQP+VbooGcJXV3GAR/DLDFkutBXFVJ5vOaP4f+
         2ZRMcVh+Sa97ixVxRdtwOcXoFj6eTZJT1tJNwwPOJbyy5+IGf/ZDvCmj1h1cVJLmBwQg
         j/uQ==
X-Gm-Message-State: AOJu0YxCYb53+6Q+Yr/JaZHPftnbi15+MFGKXDZDCykZFJZlUELUzeyC
	Q9W4FKxOsrdhzVzOrtmuoCuLNA==
X-Google-Smtp-Source: AGHT+IHfmf31vq2tHlbiG8w0Z5wpXxT3Bnc2BECIWIZVJJzMkLb4iKlmBA2BJcVeDu6mbZDNaGmWlw==
X-Received: by 2002:a05:6358:60ca:b0:139:e33d:e384 with SMTP id i10-20020a05635860ca00b00139e33de384mr5032238rwi.23.1692286407259;
        Thu, 17 Aug 2023 08:33:27 -0700 (PDT)
Received: from localhost (cpe-76-182-20-124.nc.res.rr.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id i81-20020a816d54000000b0057a67df3308sm4618133ywc.101.2023.08.17.08.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 08:33:26 -0700 (PDT)
Date: Thu, 17 Aug 2023 11:33:26 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: ksummit@lists.linux.dev,
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817153326.GA2934386@perftesting>
References: <20230816180808.GB2919664@perftesting>
 <20230817104622.511c61b4@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817104622.511c61b4@gandalf.local.home>

On Thu, Aug 17, 2023 at 10:46:22AM -0400, Steven Rostedt wrote:
> On Wed, 16 Aug 2023 14:08:08 -0400
> Josef Bacik <josef@toxicpanda.com> wrote:
> 
> > Hello,
> 
> FYI, James Bottomely posted a very similar topic:
> 
>   https://lore.kernel.org/all/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/
> 

Oh good I didn't see this, James and I have similar views on this topic.

> > 
> > This is a topic we're beating to death but haven't really made decent progress
> > on WRT real solutions.  I know I have advocated for adding even more
> > responsibilties to maintainers plates, which isn't really helpful.
> > 
> > There is a lot in this email, so I suppose choose your own adventure when it
> > comes to what we think is relevant to discuss.
> > 
> > Maintainers/long time developers are burning out.  At the same time there's
> > frustration from new comers who have trouble getting their patches accepted.  We
> > have instances of arguments between longtime developers which leads to more
> > frustration because it drags on the development process.
> 
> I'm still working on the "Communicaton style" documents (one for
> Maintainers to new contributors, and more importantly, one for new/existing
> contributors on how to communicate to maintainers and what to expect.)
> These documents will focus on looking at the POV of the other side. For the
> how to talk to maintainers, it will discuss that maintainers have to make
> sure their subsystems works for everyone, and not just for the new
> contributor.
> 
> But being a maintainer myself with a full-time job that is not to do my
> maintainership, I'm struggling to find time to work on this :-p
> 
> > 
> > I have argued for the last few years that maintainers should be taking a more
> > active role in the social side of our development process.  Be the grownups in
> > the room and help mitigate these conflicts before they sour relationships.
> 
> The "How to talk to contributors" document will try to address some of this.
> 
> > 
> > But this just adds to the long list of things that maintainers already need to
> > do.  Oftentimes they are the only reviewers, testers, and main developers rolled
> > into one.  We have an increase of automated testing, which while is a net
> > positive, adds to the stress of maintainers who view these reports as their
> > personal responsibilty to address.
> > 
> > We all work differently, so having big sweeping solutions is a non-starter.
> > However I think there are things we can learn from eachother to encourage
> > different thinking and thus result in a smoother development experience for all
> > of us.
> 
> I've been advocating in the TAB meetings for a "maintainer 'support
> group'". Basically where stressed out maintainers can join to talk to other
> stressed out maintainers and hopefully find a way to become less stressed
> out.
> 
> > 
> > Patch review: Obviously more people the better, encouraging review by trading
> > reviews for having developers patches reviewed is a good method, but this only
> > works for sufficiently large communities.
> > 
> > Automated testing: This doesn't replace review, but it can help add confidence
> > when you're accepting patch reviews from less experienced members.
> > 
> > De-prioritize automated reports: Syzbot is great, but the failure cases can be
> > sporadic and difficult to reproduce.  Things that are bisected to a specific
> > patch are obviously easy to tackle, but don't let yourself get overwhelmed by
> > syzbot, they're good things to hand to new developers to cut their teeth on.
> 
> I ignore pretty much any syzbot report that is not truly bisectable, as I've
> spent too much time on them in the past to only find out that the bug is in
> another subsystem. I won't totally ignore them. I do look at them to see if
> it's obviously a bug in my subsystem, but if not, then it's ignored.
> 
> > 
> > Maintainer groups, not sole maintainers: We all have things going on, build up
> > people you trust and develop a way to spread the maintenance load.
> 
> This goes along with my "support group" idea.
> 

Agreed.  Honestly a lot of what I've done has been born out of seeing what other
projects do, so I feel it's a decent first step towards thinking differently
about our roles as maintainers.  We don't always stick our heads up and look
around, so having somebody show up and say "I had this problem and this is how I
solved it" will hopefully be a good first step towards solving some of these
problems.

This thread has sort of wandered off into the "how to do automation" weeds.  I
think that automation is a good solution for a subset of the problems that
maintainers face, but it's not my main focus.

My main focus is we have a good set of strategies for all of the different
stresses and challenges we face, and then hopefully as a community we can
converge on a set of best practices.  Maintainership looks a lot different now
than it did when I started, and it's been a change for the better IMO.  But
we're mostly all doing this for a living now, and we need to figure out how to
make it more sustainable, and easier for us to onboard new maintainers.  Thanks,

Josef

