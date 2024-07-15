Return-Path: <ksummit+bounces-1421-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC749317CD
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6C8283A77
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D642518F2E8;
	Mon, 15 Jul 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Acoy1ShA"
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F21849DD
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721058149; cv=none; b=VE7Lf55CqNBdi5AxRfVWZxZTt9oNhPQom+xxi7eTn/8uBM8MVdexY/CJSZZldJzXwSfu+gdbz6KNfHzQ8bxY66i1vlHwHZHPFx33KOqN2BF5PwaXAJ0ObNrXbIYlbj2xl4SRiFJAEaJelenuFQpvYMM3Sd9L6DqSUjxuXujF0z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721058149; c=relaxed/simple;
	bh=Wmioe3FE2jcPEyEBlXR7O6eQLt2z6RYmYIcJdvR1J0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aElf34cm7xI1ntp2IpJWc63vSApxf0tEDQ1yXOULfq3dJpbMvUYSMug7v003ctGEXI6PA1srs1LMmViuV9ZLif9+xF3hPDMKT50SZLmUWkk8xypISytzCg5cvh6WJk5nkhQm+UDvRV4Lxk+tvejj+QwovwiASWboVzfsMSJjI0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Acoy1ShA; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d92df7e83cso2287369b6e.0
        for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721058147; x=1721662947; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWsQjj24y8Kv3GbsQfaSz5LEBjQ9cIFHd60B4v8J/OY=;
        b=Acoy1ShABmnLKCJbo18xgP+gWv9DeyljcAGfr+UWSpP6GATxtpK5jYbHxW7+jjmWQY
         NyiVohFW1A9boqqCc4MppadWF2ayG1KzL7fS/1HDq27KRBS3dYuE1I67DsNiia2uSptc
         vAo4nRH221aDeS//H2OIxlcdQ1HIrK4nfiL7HQYgkjVkmbJ+bKImd6ksWqct4BcbBrpB
         4t6vJNCmx1FKGLmxfJvlI7O/eNPkZ8p1jdiMJTvXj4oqoWtiFWi67SJRXfh/y4Moem5S
         AIajuLFJvsLKxnVf/9zVkaMKwfHuJwJyyW5dcfMAJm7tEP3fVR0s6HVG0kohJJyLb794
         S6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721058147; x=1721662947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWsQjj24y8Kv3GbsQfaSz5LEBjQ9cIFHd60B4v8J/OY=;
        b=aodZaTKLby/XEZ4A4M4siJjRFhLU1LFZqj8ex98butyjG5SqpOXVbWvKRxiq226YJQ
         p1I3d/+u9nOCeJzQzWHa7E0WIO5PEbaf8cavWehz94CrdhMxto91Hr+m5a7NikF5VUjM
         elV6PJkibYlaJmMPez1VQHKGYsvcklWynfCMBQG1Qyp/2gbbi8cJ68K0QRadog2vKvgJ
         7gqYTpTw/qB1/Rb+dqdaW5axWf7Xa9WvIGsEAHW8MNd6Izxv3Ty4EoDUOG7Jas4rwZy8
         n9lq33AP7kglywLPIeyfGg32DoPSs4M3THYwehUnFnvcVsFLbBUCVcFE0bEhwjeL2dZv
         VxQA==
X-Forwarded-Encrypted: i=1; AJvYcCVOVxDgC3Q4UFWSpVh2wCncbHx9hwmR8tjz7llOdCc8slB3HECz2y/gr9GVOGb+tsRmy06+KQWn2VLmXl13qYCKmOFXw8uwJA==
X-Gm-Message-State: AOJu0YyjJW1dlK0b/362OnwvtrrPjRECz/3O96C+7d/N8AwYLtk7b2wH
	Qk+PSeMkdx6CzqB7+zXYlg+rzLJbQqht9NOa4ivx3GGgf4WHbF9p5lgv8hZdjao900E4ExvgjRb
	a
X-Google-Smtp-Source: AGHT+IFk7bXzsd4HDgX0GYn3guilaoQi6igvI3umKPbWan1T3uQYjOEL+FrF2465jfHXLPvJLuTuDg==
X-Received: by 2002:a05:6808:138e:b0:3da:a185:5a6e with SMTP id 5614622812f47-3daa96d9e36mr4599169b6e.15.1721058146552;
        Mon, 15 Jul 2024 08:42:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:358f:3413:c118:4021])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dab3e1c589sm815635b6e.52.2024.07.15.08.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:42:26 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:42:18 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sasha Levin <sashal@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <4094cac1-70f8-42ff-86c6-1e08fc6253b9@suswa.mountain>
References: <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
 <87h6cqya32.fsf@trenco.lwn.net>
 <b71b6745ae79ae40196d82c0c306acdc174c0994.camel@HansenPartnership.com>
 <ZpU-A9avLDktkFT_@sashalap>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpU-A9avLDktkFT_@sashalap>

On Mon, Jul 15, 2024 at 11:19:31AM -0400, Sasha Levin wrote:
> On Mon, Jul 15, 2024 at 11:07:30AM -0400, James Bottomley wrote:
> > On Mon, 2024-07-15 at 09:00 -0600, Jonathan Corbet wrote:
> > > Are developers and maintainers expected to put in stable tags the way
> > > they are expected to add Signed-off-by, or is it a fully optional
> > > practice? In the latter case, I'm not sure how much good messing with
> > > the tags will do.
> > 
> > So what's documented is
> > 
> > Fixes: is generally useful outside of stable (for bug tracing and the
> > like) and is thus not optional.  It simply means something about the
> > target was updated by the patch, but this could be spelling in comments
> > or white space and thus may not be a stable candidate.
> 
> But then look at how folks interpert the Fixes tag:
> 
> On Sun, Jul 14, 2024 at 12:27:55PM -0700, Linus Torvalds wrote:
> > I would hope that *all* commits improve on something. And if it's an
> > actual fix to a previous commit, it should say so.
> > 
> > If it's just a random improvement, it shouldn't refer to a previous
> > commit at all.
> 
> Linus (and others) see the Fixes tag differently than how you (and
> others) see it.

I don't see how those two statement conflict.

Fixes tags are totally separate from stable.  It should never be a
thing where "This patch doesn't need to be backported so leave off the
Fixes tag."

To me the main ambiguity is in cleanups.  Is this where the Improves-on
tag would be used?  I tell people to only add Fixes tags for actual
fixes.  If a patch is just silencing a static checker warning like
"delete write-only variable" then I'll mention the commit which
introduced warning, but I won't add a Fixes tag.  "We stopped using
variable "foo" in commit 2342423 ("blah blah blah").  It's unnecessary
now.  Delete it."

In Steve's case there was a debate whether it was a Fix a or new
functionality.  That line can be blurry as well.

regards,
dan carpenter

