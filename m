Return-Path: <ksummit+bounces-1444-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5018934F5E
	for <lists@lfdr.de>; Thu, 18 Jul 2024 16:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148921C21E39
	for <lists@lfdr.de>; Thu, 18 Jul 2024 14:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C901422D9;
	Thu, 18 Jul 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nSBBWhDc"
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC76F312
	for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314128; cv=none; b=aD5SBzKAJJqgN9gQ9wSaDwywuOlYCBDHb3z0ZsIexSsPUv1IWDGu4IfIoFa7jUqDoQZxLmegFpZ9edYAB7aAFTEh8YpjVF80K1JYcoZ7P3SxfhoubVyG2dMGgxPMS4tgteRvytSVoTF9AbyfRrveFoEFzyHHKNlAp5wMPKAt1nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314128; c=relaxed/simple;
	bh=hemoEz1ZzdFNbzOcegijP1dAlDPhAQy8InTC1thRjLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+4WME9f1ZRRKDntFasCh6HLqUMSHdOJdDL867KzEk5c8wbJg4Up27ppeEm+qbqpX/9yUbdaWb3AkwEKY1A+qYTw8IoLtGlHGSup/LVMfmKjaHNjc0W5zE/4xanWSrs+3SURghhwCFr+N682bE2jC6I8KC3zpMzFRIBllpcfwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nSBBWhDc; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7044bda722fso532628a34.2
        for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721314125; x=1721918925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWPVbOaqKkkmaYVvdkA4AskpliDllAji8OhI9w1X41w=;
        b=nSBBWhDcCtNWDeXimOBAMWWw857pWSx3+N3Y4CO0cXCZwha/k8CN9AadY7wHwyGSwx
         wPkOM4O8b1XORvQ9rB/s9VMIfA17fRG8DTplBubaiFOifgI+G/f4yyDZFPvPGde48xda
         +aly+S6XxwxAqN+9PHLHZT9n/wWJmzLi70N+tI6pbS+d18rLgklNWzJivye0ojrL6p00
         dt17SbM5j0CrkV3oPNAXSx1uZvTdYxcoBiipOBRhVihvrP7Wy/D+bgPk4GIKiLmKTxHZ
         mmCaXnDbot7a2GKJv6PzMwGXEzRkWrB+6Q24nXHghvCZt8HRn/L/NH7PSW+mV2bR8dRx
         bmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721314125; x=1721918925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWPVbOaqKkkmaYVvdkA4AskpliDllAji8OhI9w1X41w=;
        b=GzMR0bw2BAsUKwb1hv5YIyYvG0Ejb7zk9A3Tr0m580weRwPyOCaVvG2A/vjgWU7ZjM
         dn6Y56BYGoa30iRblAQuPVOyyFxlvmTfEAM/3NymXH9rCvOh/2ozo71ZhJ8MCfStlFvP
         IuAopdT2ouw6v8FiDI5GeFC9vwntEqWe47mZxLbjVernBNIbbTh9GKcymjFhdoxrJxok
         0mb5UWa2FKVOukXy8oQRI2RnY6uZI7bArn/wMDbTK4AjEc0twHySmpfWFnLGhodB5/BX
         dJf7DKrJfK1AG614e014wSsgSk2xkWiBmnkg9mLcH7Jlo04m9HRsAH55PbPAU6OFyXfv
         AQcw==
X-Forwarded-Encrypted: i=1; AJvYcCV+IV1yPqrqVMZhG961q0D9FzpXvZaNRfzQPsYhe7BrQRKxAh5LD724bNXmSMYJoUbF+shLXgY7ohsHKuGS0zU6mzwVEHaqpA==
X-Gm-Message-State: AOJu0Yxkdn3OgSdlF301yELhMTFSLAICD6dpdymaCz0Uvk9OdySvPRuV
	AkneCZcmQULc4GT+7rFPY9SbFh3TrAOEuSnMBObywHeYbl09PrQMKb7TwUsIEW4=
X-Google-Smtp-Source: AGHT+IGcRKe0iXRmZIBh1JtnYcJPf9DEa7iK7WDGr7QY9J+3wHdtO+JWZMXhbeGQfKkfXrKHYMJo+w==
X-Received: by 2002:a05:6830:630b:b0:703:5c3d:e3f3 with SMTP id 46e09a7af769-708e3778170mr6299755a34.14.1721314125101;
        Thu, 18 Jul 2024 07:48:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1a6d:d3d6:98e4:34e1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708e784007asm460674a34.38.2024.07.18.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 07:48:44 -0700 (PDT)
Date: Thu, 18 Jul 2024 09:48:42 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <0c1d7d04-8040-4843-8aec-59c155273f84@suswa.mountain>
References: <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
 <ZpWK0m7Ps6Y4vjL2@google.com>
 <2024071605-bulb-plop-9cea@gregkh>
 <87frs91qat.wl-tiwai@suse.de>
 <ad9720d8-6b4e-4f7c-bf72-b3c2db8887d4@suswa.mountain>
 <87v813w3v7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v813w3v7.wl-tiwai@suse.de>

On Thu, Jul 18, 2024 at 09:34:04AM +0200, Takashi Iwai wrote:
> On Thu, 18 Jul 2024 00:05:06 +0200,
> Dan Carpenter wrote:
> > 
> > On Tue, Jul 16, 2024 at 02:20:42PM +0200, Takashi Iwai wrote:
> > > > > > The one question I have is for patches which pre-date git.  I was told
> > > > > > to leave the Fixes tag off in that case, but I think that's out of date.
> > > > > > It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".
> > > > > 
> > > > > If a thing was there since before git and only now is being discovered
> > > > > it either needs to be explicitly marked for stable with cc: or we can
> > > > > just keep the fix in newer kernels. IMO this particular "Fixes" tag does
> > > > > not bring any value.
> > > > 
> > > > On the contrary, if I see just a "cc: stable" and no "Fixes:" tag, I do
> > > > a "best effort" to backport to all current stable/lts trees.  If it
> > > > fails on 5.15 and older, great, I don't warn anyone about that as there
> > > > was no Fixes: tag for me to know how far back it should go.
> > > 
> > > That's what I expected for the cases I put only Cc-to-stable; they
> > > have been mostly some trivial quirks only for new devices, and the
> > > stuff that can be taken safely when applicable -- otherwise just
> > > skip.
> > > 
> > 
> > That's the same thing that happens if you add the Fixes: 1da177e4c3f4
> > ("Linux-2.6.12-rc2") tag.  Greg and Sasha aren't manually backporting
> > patches unless they seem security related.  When a patch doesn't
> > backport cleanly, the stable maintainers rely on other people to backport
> > patches they care about.
> 
> Well, in my case, it's not always Fixes:Linux-2.6.12-rc2; the relevant
> code has been often added later.  But pointing somewhere new as Fixes
> also won't work, since there are other dependent fixes.  And tracking
> all those is really hard, and not worthy.

One thing that I think is that Fixes tags aren't really fair.  For
example, imagine someone sends an "Add bounds checking" patch but the
bounds checking has an integer overflow.  The "Fix integer overflow"
patch will point to the bounds checking patch even though the bug was
there in the original code as well.

Blaming the second patch works from a review perspective because
we can see why the integer overflow was added.  It also works from a
backporting perspective because the patches depend on each other.

Unfortunately, from just looking at the tags someone might think that
the "Add bounds checking" patch added a regression.  For example, LWN
sometimes looks at how many regressions are added to stable kernels.
(The LWN numbers are always going to be approximations it's fine.  I
love LWN).  But I've seen people complain about the unfairness of
assigning fixes tags this way and I just think that from a practical
perspective it's the only thing which makes sense.

> It's a thing that can be
> backported safely whenever it's cleanly applied and built, but
> otherwise it can be simply skipped.

That's how it's going to work either way regardless of if there is a
Fixes tag.

> It's no "regression", per se, but
> a new feature that didn't exist in the past, after all.
> 

If it's not a regression then don't add a Fixes tag.

regards,
dan carpenter

