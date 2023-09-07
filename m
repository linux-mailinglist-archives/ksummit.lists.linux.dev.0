Return-Path: <ksummit+bounces-1083-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E95796ED9
	for <lists@lfdr.de>; Thu,  7 Sep 2023 04:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7A61C20B47
	for <lists@lfdr.de>; Thu,  7 Sep 2023 02:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECB0A51;
	Thu,  7 Sep 2023 02:22:48 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF58A29
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 02:22:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c336f3f449so4014585ad.3
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 19:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694053366; x=1694658166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=srIwWKbC660nigrXTpX+thXv3rAgs/4zyz6RieRjYho=;
        b=mjpqxjsNJv6/UYlHjztVVoCiGGgD/5oYTNx7qQ4deHcqIwhfHaeRr0HKeEJk3bFrCB
         rfE/b+un8tzbIwXCrTlKMIeFcY7dHu/gixnS9SJgQAAHwYDhm9TzsxUUe49sX1eNUDhT
         42Hyp+FXIRnBrR3DIuizYmyu+WTd0wA/Pf7MW4CF8xx0ZW1WY4Qi7LcnKXBlWYEUoFPG
         qxRRmM31s/TqbHUV0dUG5+Gj6q96BJbPK01+XTxG6W2hEFS78VRcV1vuJrTCbVFyiEyz
         YrkO8cAYc5oX+jHR7940oZAhpVknVar4YZ2YkD1zTVh4fliCdgdBrpaD3iLzd93e0LDX
         QrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694053366; x=1694658166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srIwWKbC660nigrXTpX+thXv3rAgs/4zyz6RieRjYho=;
        b=SLp9CPRgZBRUIYErv5Boy7lxMC1Avk/T8fMoeqJHvI8HWuX/NP5pEwFoS9V/RDgGCO
         Yj2bT5M5CpRyCEkLAWp00lqmPEfdS1FOtIx77Yj06oGCWE1kSPtRN+XCTFS2IENX9L+j
         DIRoKTEMWz+1yEjF7FYUhEbNcEp4rsoG3BgFSHUXU4uYdPaIU31FMCc5kYYD1XID/8RR
         La8Wn8vtDhQUfY1L6KkXZVJvfbZ4CxN0VyDEynxc3X43Mgwv++gW7aWY8YigOfhribwg
         c4FDmepjo5zC38XV1wFKcRGIyf0leO5PHdf+xZTl3Qd6o88UGyJ/HLG55zNy0gZfq1m2
         Zo3A==
X-Gm-Message-State: AOJu0YyRUcxD2WddXPoAwMsMXBTUKqaxkx+/IkcwMXj9f5K6SSJsr+rN
	Ri6rkSedkLv+pkSg/rGpFH4OQw==
X-Google-Smtp-Source: AGHT+IGXEgwTgDu15D8hEMBL3TxZQ44fyP5BziVoXzPSzJnafhlvNTErafURMhuJEuS4Y5eaGAOAhQ==
X-Received: by 2002:a17:903:1d2:b0:1bd:fbc8:299e with SMTP id e18-20020a17090301d200b001bdfbc8299emr23403514plh.4.1694053366281;
        Wed, 06 Sep 2023 19:22:46 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902e80a00b001aadd0d7364sm11707517plg.83.2023.09.06.19.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 19:22:45 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qe4fL-00BqCW-1c;
	Thu, 07 Sep 2023 12:22:43 +1000
Date: Thu, 7 Sep 2023 12:22:43 +1000
From: Dave Chinner <david@fromorbit.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPkz86RRLaYOkmx+@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906215327.18a45c89@gandalf.local.home>

On Wed, Sep 06, 2023 at 09:53:27PM -0400, Steven Rostedt wrote:
> On Thu, 7 Sep 2023 08:54:38 +1000
> Dave Chinner <david@fromorbit.com> wrote:
> 
> > And let's not forget: removing a filesystem from the kernel is not
> > removing end user support for extracting data from old filesystems.
> > We have VMs for that - we can run pretty much any kernel ever built
> > inside a VM, so users that need to extract data from a really old
> > filesystem we no longer support in a modern kernel can simply boot
> > up an old distro that did support it and extract the data that way.
> 
> Of course there's the case of trying to recreate a OS that can run on a
> very old kernel. Just building an old kernel is difficult today because
> today's compilers will refuse to build them (I've hit issues in bisections
> because of that!)
> 
> You could argue that you could just install an old OS into the VM, but that
> too requires access to that old OS.

Well, yes - why would anyone even bother trying to build an ancient
kernel when all they need to do is download an iso and point the VM
at it?

> Anyway, what about just having read-only be the minimum for supporting a
> file system? We can say "sorry, due to no one maintaining this file system,
> we will no longer allow write access." But I'm guessing that just
> supporting reading an old file system is much easier than modifying one
> (wasn't that what we did with NTFS for the longest time?)

"Read only" doesn't mean the filesytsem implementation is in any way
secure, robust or trustworthy - the kernel is still parsing
untrusted data in ring 0 using unmaintained, bit-rotted, untested
code....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

