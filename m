Return-Path: <ksummit+bounces-1088-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECEF796F50
	for <lists@lfdr.de>; Thu,  7 Sep 2023 05:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A471C20AC3
	for <lists@lfdr.de>; Thu,  7 Sep 2023 03:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2747EC9;
	Thu,  7 Sep 2023 03:38:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB49EA9
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 03:38:44 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5735282d713so292701eaf.2
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694057924; x=1694662724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uorzJTWjpJ1Fc52MIfasTvSm9qcmhLcqEHLz5w6p+gQ=;
        b=Nb8xrweCANWj+bV8dyKH8tTAQxOBtFxbjLNyS2Kcj0sSD1o3LhV71lOla7c/FHkpXd
         GyBsMrvbEQAGNk8MfiqccSsIblTlc93hA8Opa4aVtliGRWk07gKPiR3ucv74y9XX1xfh
         uoPuKeeov1taRg1ex5VfOnPnsRAPLUCbLJXl6CMvpGWAfRm89XJPLtviWMTK+bvaUfm4
         /TmOKdfw+KJeYR+xO086GkOVQl/P8KA5aE3gMkk2ktRYi3qTKFkccQHCbLe5oCGAgg8r
         8mULnmSzEVEm89l0y2WB/M3MgreKtktAwgCMftfq3a4f47dOi+KPw/Zw8cgNACOn5P5q
         blBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694057924; x=1694662724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uorzJTWjpJ1Fc52MIfasTvSm9qcmhLcqEHLz5w6p+gQ=;
        b=L2CwTgiMGpccJzGiGr+7HQCty0+R63/g+aZiKue325ff7Xcgkt45eOxPznYbPVe2cJ
         bbJqLEsfICXbByHmBTL9kWnoDO64cKlVxtuEGUnArqWjhNcBnHs6dijCxTYtS3hM4x7f
         HLiWNTzhl+VhQ+YUkZnfvYYKJP0qJDzDSOuXLKcubjoG0BRJf9/3DOhuG2Kakp+4W6dk
         7aFhnheANiSvPdob/6b1tg+Bhq4EWiR5zPd1VxotdWqc9zTecSo8higxZMgSv/+xwon6
         x1lhLadQqCJuyWuZZAzYHL774GMMZ9pJaSyMcyN9jhBAP4X7n4F5b3DJ2GwUSyBdGcKb
         njFw==
X-Gm-Message-State: AOJu0Yy8qrCdycFS12ruU0OhnSMMH9M9MpM0JrEKlyhr/O0QaXJJb2vB
	JWcrzyBlgTJAz5qw3EUV9PgTIQ==
X-Google-Smtp-Source: AGHT+IEDjq+OShKOIy6PXr7PgrmfLuQ+vrNWOIjP/J9E/GglwOVAegdinD6YN5kFQSgpQe/Tb6mbqg==
X-Received: by 2002:a05:6358:91a4:b0:12b:e45b:3fac with SMTP id j36-20020a05635891a400b0012be45b3facmr5912445rwa.32.1694057923767;
        Wed, 06 Sep 2023 20:38:43 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id n26-20020a638f1a000000b0055b61cd99a1sm11785712pgd.81.2023.09.06.20.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 20:38:43 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qe5qq-00BrjP-21;
	Thu, 07 Sep 2023 13:38:40 +1000
Date: Thu, 7 Sep 2023 13:38:40 +1000
From: Dave Chinner <david@fromorbit.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906225139.6ffe953c@gandalf.local.home>

On Wed, Sep 06, 2023 at 10:51:39PM -0400, Steven Rostedt wrote:
> On Thu, 7 Sep 2023 12:22:43 +1000
> Dave Chinner <david@fromorbit.com> wrote:
> 
> > > Anyway, what about just having read-only be the minimum for supporting a
> > > file system? We can say "sorry, due to no one maintaining this file system,
> > > we will no longer allow write access." But I'm guessing that just
> > > supporting reading an old file system is much easier than modifying one
> > > (wasn't that what we did with NTFS for the longest time?)  
> > 
> > "Read only" doesn't mean the filesytsem implementation is in any way
> > secure, robust or trustworthy - the kernel is still parsing
> > untrusted data in ring 0 using unmaintained, bit-rotted, untested
> > code....
> 
> It's just a way to still easily retrieve it, than going through and looking
> for those old ISOs that still might exist on the interwebs. I wouldn't
> recommend anyone actually having that code enabled on a system that doesn't
> need access to one of those file systems.

In which cae, we should not support it in the kernel!

If all a user needs is a read-only implementation for data recovery,
then it should be done in userspace or with a FUSE back end. Just
because it is a "filesystem" does not mean it needs to be
implemented in the kernel.

> I guess the point I'm making is, what's the burden in keeping it around in
> the read-only state? It shouldn't require any updates for new features,
> which is the complaint I believe Willy was having.

Keeping stuff around as "read-only" doesn't reduce the maintainence
burden; it actually makes it harder because now you can't use the
kernel filesystem code to create the necessary initial conditions
needed to test the filesystem is actually reading things correctly.

That is, testing a "read-only" filesystem implementation requires
you to have some external mechanism to create filesystem images in
the first place. With a read-write implementation, the filesystem
implementation itself can create the structures that then get
tested....

Hence, IMO, gutting a filesystem implementation to just support
read-only behaviour "to prolong it's support life" actually makes
things worse from a maintenance and testing persepective, not
better....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

