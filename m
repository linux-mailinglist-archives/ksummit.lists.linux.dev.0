Return-Path: <ksummit+bounces-1086-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868B796F36
	for <lists@lfdr.de>; Thu,  7 Sep 2023 05:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8C31C20B4B
	for <lists@lfdr.de>; Thu,  7 Sep 2023 03:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F3EEC0;
	Thu,  7 Sep 2023 03:14:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4379A21
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 03:14:13 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6bcb5df95c5so416639a34.1
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 20:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694056452; x=1694661252; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vj3i6Xm3aT1ZnQ3daxbVq6RG4JnRtM08w+X0vw1mExo=;
        b=eM/6f6C76cmfR5N8k3Hk4G/CZMLmkMiO+xagyv3s46vT7lujs62FgXgXAyd+ZM2k/J
         8SD/xp0U6PQgSeGMR04dQHmyd21xR/7eOZ7Fb2/CGCU56G0xWQ0ZJykad4MbAu6fBu2v
         xxFS+ewkRfhsaq5KDAIk1Jm6lo3EyR7HnaN5dn9V7rZnwlUvynH/W3e4n6Ap30CWIxX7
         8r4XaFYtPNql/Fsfrq/eRWBTeOLbVN9Eo5k4Pr8wmZuwh0jUGBIGra4uZRpotkB43ont
         P19aqPInaodbPhj2CZewUl16C7hPZoOZDrCsd5/7tHzvcn0zH/oDTcf69WCH7GoU+KRj
         m6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694056452; x=1694661252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj3i6Xm3aT1ZnQ3daxbVq6RG4JnRtM08w+X0vw1mExo=;
        b=WVjJuDj5Q/BqXZST5C71mU0mRXapDx5wKf93J4toI56E+7ot+vSAmhEIYG/gS6YpII
         ohUvKoG0cs3YasCIvlKdzkdq2nDE5wBMFwcCGJaOQzem8QPTrXyDe8iWeCEo3EMPE7ne
         KYL4XAtpqDKD89juYHB4G0n/RYYfloCyd/weJBhqdw5Gn4AJsWbfDT8tIXWCcQwb+8K2
         vGrwaf6xu75YxGphKZlFwef4hWeh3BmlqyBaKpa2euUnQVCNblVAi/9jSmfk3jNG7Xds
         +oSvg2rlyvb1Q2BqMdxnQbDUr4VfMelqnr/a47z3vpOeNVDlw0ocQ0sRJzEaJDInF1GF
         T2OA==
X-Gm-Message-State: AOJu0YwGj2LS1eD56YAAXyukSg8cq2ILdRs7TJdNfHHxarwO2vt9Ahbf
	v9e2x4gdodSI2faZ8zdsTG8WJw==
X-Google-Smtp-Source: AGHT+IEfy6DclIqqkSkE74UpMs3vv8gKv3DEqPytuAq3cLsyQKYY07PLM+vXkf+CzNB0KAlDEt+rsw==
X-Received: by 2002:a05:6358:9389:b0:134:cb1d:6737 with SMTP id h9-20020a056358938900b00134cb1d6737mr5465205rwb.7.1694056452253;
        Wed, 06 Sep 2023 20:14:12 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id ds1-20020a17090b08c100b002680dfd368dsm451073pjb.51.2023.09.06.20.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 20:14:11 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qe5T6-00BrEb-30;
	Thu, 07 Sep 2023 13:14:08 +1000
Date: Thu, 7 Sep 2023 13:14:08 +1000
From: Dave Chinner <david@fromorbit.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPlAALO3o3Nnnh1R@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <ZPkfEFTsBOk3iVuQ@debian.me>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPkfEFTsBOk3iVuQ@debian.me>

On Thu, Sep 07, 2023 at 07:53:36AM +0700, Bagas Sanjaya wrote:
> On Thu, Sep 07, 2023 at 08:54:38AM +1000, Dave Chinner wrote:
> > There's a bigger policy question around that.
> > 
> > I think that if we are going to have filesystems be "community
> > maintained" because they have no explicit maintainer, we need some
> > kind of standard policy to be applied.
> > 
> > I'd argue that the filesystem needs, at minimum, a working mkfs and
> > fsck implementation, and that it is supported by fstests so anyone
> > changing core infrastructure can simply run fstests against the
> > filesystem to smoke test the infrastructure changes they are making.
> 
> OK.
> 
> > 
> > I'd suggest that syzbot coverage of such filesystems is not desired,
> > because nobody is going to be fixing problems related to on-disk
> > format verification. All we really care about is that a user can
> > read and write to the filesystem without trashing anything.
> > 
> > I'd also suggest that we mark filesystem support state via fstype
> > flags rather than config options. That way we aren't reliant on
> > distros setting config options correctly to include/indicate the
> > state of the filesystem implementation. We could also use similar
> > flags for indicating deprecation and obsolete state (i.e. pending
> > removal) and have code in the high level mount path issue the
> > relevant warnings.
> 
> Something like xfs v4 format?

Kind of, but that's a story of obsolescence, not a lack of
maintenance.  For those that don't know the back story, it's below.
For those that do, skip the bit between the '----' lines.

----

We deprecated the v4 XFS on-disk format back in 2020 because it was
superceded by the v5 format that was merged in 2013 (a decade ago).
Since then we have not been adding features to the v4 format because
the v5 format fixes a heap of problems with that old format that
can't otherwise be fixed without changing the on-disk v4 format to
something like the V5 format.

Now throw in the fact that the v4 format is not y2038 compliant.
It's got a hard "end of life" date without putting resources and
effort into an on-disk format change. We aren't going to do that
largely because the V4 format is a development dead end.

Because the v4 format has a hard end of life date, we needed to
have a deprecation plan for the format that was sympathetic to
enterprise distro feature removal policies. 

Given that there's usually a 10 year support life from first release
in an enterprise kernel, and typically a 2-3 year lead in cycle,
we're looking at need to have filesystem feature removal occur 10-15
years before the hard end of support date. Further, feature removal
policies required us to mark the feature deprecated for an entire
major before we can remove it in the subsequent release. This means
we needed to make a decision about the V4 format in 2020, a full 18
years before the hard end of life actually occurs.

[ How many people reading this are thinking about what impact a
decision made has on people using that functionality in 10 years
time? This is something filesystem developers have to do all the
time, because the current on-disk format is almost certainly going
to be in use in 10 years time....]

So we deprecated the v4 format upstream, and the enterprise kernels
inherited that in 2020 before the major release went out the door.
That means we can remove support in the next major release, and the
upstream deprecation schedule reflects this - we're turning off v4
support by default in 2025...

We don't want to carry v4 support code forever, so we have a
removal date defined as well. All upstream support for the v4 format
will stop in 2030, and we will remove the relevant code at that
point in time.

Long story short, we recognised that we have obsolete functionality
that we cannot support forever, and we defined and documented the
long term EOL process for to removing support of the obsolete
functionality from the filesystem.

This, however, does not mean the V4 code is unmaintained or
untested; while it is supported it will be tested, though at a
lesser priority than the v5 format code we want everyone to be
using. THe V4 and V5 formats and code share huge amounts of
commonality, so even when we are testing V5 formats we are
exercising almost all the same code that the V4 format uses....

-----

It should be clear at this point that we cannot equate a well
planned removal of obsolescent functionality from a maintained
filesystem with the current situation of kernel being full of
unmaintained filesystem code.  The two cases are clearly at opposite
ends of spectrum.

However, we should have similar policies to deal with both
situations. If the filesystem is unmaintained and/or obsolete, we
should have a defined policy and process that leads to it being
either "community maintained" for some period of time and/or
deprecated and removed from the code base.

Look at reiserfs.

The maintainer stepped back and said "I'm happy just to remove the
code from the kernel". It has been unmaintained since.

Rather than pulling the rug out from under any remaining users,
we've marked the filesystem as deprecated (and now obsolete) and
documented a planned removal schedule.

This is the sort of process we need to discuss, formalise and
document - how we go about removing kernel features that are no
longer maintained but may still have a small number of long tail
users with the minimum of disruption to everyone....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

