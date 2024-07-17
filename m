Return-Path: <ksummit+bounces-1442-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81E93448F
	for <lists@lfdr.de>; Thu, 18 Jul 2024 00:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 185101C20F24
	for <lists@lfdr.de>; Wed, 17 Jul 2024 22:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425573BBFB;
	Wed, 17 Jul 2024 22:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODd9g/Qg"
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB12574B
	for <ksummit@lists.linux.dev>; Wed, 17 Jul 2024 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721253913; cv=none; b=X8RbSJj3HJwaGQdxDgfqqsRA3gJKMvUlFosnSB+9BhkGe9PQAF5aSG/v0skFPl9cMRivcjlDkkEzb5AdYuOqwTGEB299TZ58xqYi1u0pNXikZJ3sYCMLrytqfbDlDBsMgTTD89dZf9QT70d6ixpp8b0SS61UxSibSVudQ6d1sbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721253913; c=relaxed/simple;
	bh=jfJGayiDK3wg3RKM1Fa4VrOYM5GNVQGp5MBBB4F57Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/aGN09jFm1Hy78ai+xazUEEq5lGKp9XGxGXpQxBgqD0Ibpp0DVpOnl4HU2+DeShD7gJBtVXw/r5lXvtjj8Z16LaMTBoHrJc1DyF+FpovOh1dI0YoLTHYMHyhkBjuZvdBvdWKQpevpjaVI5L5o3TWfoDJJkFO8218VxZhok0gI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODd9g/Qg; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-703d5b29e06so81162a34.2
        for <ksummit@lists.linux.dev>; Wed, 17 Jul 2024 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721253911; x=1721858711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHgEDPRENC88Yoaa8QGQQsD6O7+sN9iA96wZ3dWTT4M=;
        b=ODd9g/QgE5rhJ9ynbqJZUy5+FM8s0NvP2fCn2ClkzvCQtjED1Ez0AUFJubOmsdtG6r
         M9yYzc6T9V9iQFwGWKgmY0FCSPpS37xX9qow0PYOzbdVT0Fx5AaiDWQipDtq/NC0HfcV
         a0NZ6X6Bs3B8KV0ib6Xlno7pxeSj6B2yNKZ3SJnfE6et2Qg/YOhx8wzAdvFlv9XSsdye
         IL6XEsI71ULsHDJ52xUJgr1Y5VuyJZ/C3mzkBLtvbXcInNnCvFsS7dtwz7Y+pb7bclcb
         3DOHAVL3JRtvJkQiMRbxIrwpAf4yKwpGSFV7oXp7P6BEqsIADhseZGrZQX/wSH7pWvt5
         WXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253911; x=1721858711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHgEDPRENC88Yoaa8QGQQsD6O7+sN9iA96wZ3dWTT4M=;
        b=cntR71dBSH3mBRlZvlCYKE35/nnEp3/8wlTmSPZltBjwJtkoa3dsDkYmnmUn4aGyEj
         jZFCDD/gCJRB4p/5zbeimE++0Aod96mmGB2HuFAfttw8wMCAWZWjARIjkbAMLYkvJD5n
         vv+WsAz81HuZsYuR6T8SpXgCd7lj/J/GhBrdHUKN7HWVWtCwSgKxoImavkCsFHhhk+oC
         kAcQuPCP4RGmlbf46FpTleE87VpCi0CnW3eGx8bBXclu+f6GAAii56M1cMh3ZBpiPRBh
         JjyfsdeEN7ajcM0IrSW8UwL5nvaxRSwgXc0DRszkzyeL+/323NIUxcWnBvF7vlENvxVI
         FOjw==
X-Forwarded-Encrypted: i=1; AJvYcCVn0Sn4AFKtu6hgGJFbADinUofNQ44we2nd23G4fK8kd+sDKgSgwUQYPe55qVRiSjBaI/nIkRoETEumvrEO5Z2djs6vi2M6GA==
X-Gm-Message-State: AOJu0YyrGqBXIq5WrzksBy0gaLfRVbOkC52DN5vEIS3RoFWm2WPvl8Oy
	GAytE9jBhBLXukaJLFmlIYAaNOPxxy4QaL16Y646qGdas4vSJGgV0BwKKdwFhVQ=
X-Google-Smtp-Source: AGHT+IHy6oO/Jy7vu6Hfl+Q01tqL37F8+ESvMxHjlDKFABXD21tfOdyy61uTfAWhznSExXZx0XPDhA==
X-Received: by 2002:a05:6830:264b:b0:703:6477:460a with SMTP id 46e09a7af769-708e3861904mr3217969a34.29.1721253910080;
        Wed, 17 Jul 2024 15:05:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f90b:a43c:39d1:be63])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708e7832c60sm241464a34.35.2024.07.17.15.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:05:09 -0700 (PDT)
Date: Wed, 17 Jul 2024 17:05:06 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ad9720d8-6b4e-4f7c-bf72-b3c2db8887d4@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
 <ZpWK0m7Ps6Y4vjL2@google.com>
 <2024071605-bulb-plop-9cea@gregkh>
 <87frs91qat.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frs91qat.wl-tiwai@suse.de>

On Tue, Jul 16, 2024 at 02:20:42PM +0200, Takashi Iwai wrote:
> > > > The one question I have is for patches which pre-date git.  I was told
> > > > to leave the Fixes tag off in that case, but I think that's out of date.
> > > > It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".
> > > 
> > > If a thing was there since before git and only now is being discovered
> > > it either needs to be explicitly marked for stable with cc: or we can
> > > just keep the fix in newer kernels. IMO this particular "Fixes" tag does
> > > not bring any value.
> > 
> > On the contrary, if I see just a "cc: stable" and no "Fixes:" tag, I do
> > a "best effort" to backport to all current stable/lts trees.  If it
> > fails on 5.15 and older, great, I don't warn anyone about that as there
> > was no Fixes: tag for me to know how far back it should go.
> 
> That's what I expected for the cases I put only Cc-to-stable; they
> have been mostly some trivial quirks only for new devices, and the
> stuff that can be taken safely when applicable -- otherwise just
> skip.
> 

That's the same thing that happens if you add the Fixes: 1da177e4c3f4
("Linux-2.6.12-rc2") tag.  Greg and Sasha aren't manually backporting
patches unless they seem security related.  When a patch doesn't
backport cleanly, the stable maintainers rely on other people to backport
patches they care about.

Eventually, if patches don't apply then they're manually reviewed.  I
find it really frustrating to review stable patches without a Fixes tag.
When I see it I think that probably I wouldn't have had to manually
review the failed patch at all if they had used a Fixes tag.  (I just
naturally start assuming the worst about people after I've spent five
hours backporting patches.  I'm not going to investigate it either
because it's not security related.  I'm just going to assume the worse,
say some curse words, and move on.)

Of course, for security related stuff the Fixes tag is absolutely
essential.  For example, this patch does not backport cleanly to 4.14
kernels.
https://lore.kernel.org/all/20240501125448.896529-1-edumazet@google.com/
It's really nice that Eric Dumazet added a Fixes: 1da177e4c3f4
("Linux-2.6.12-rc2").

As a upstream reviewer, I think the Fixes tag is important as well.  I
don't think I've ever used the Fixes 1da177e4c3f4 ("Linux-2.6.12-rc2")
tag because I know it annoys people but I write that "This bug has been
there since before git" because the information is useful.

regards,
dan carpenter

