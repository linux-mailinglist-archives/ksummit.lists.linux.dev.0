Return-Path: <ksummit+bounces-1129-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7479C112
	for <lists@lfdr.de>; Tue, 12 Sep 2023 02:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96723281466
	for <lists@lfdr.de>; Tue, 12 Sep 2023 00:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E05438D;
	Tue, 12 Sep 2023 00:23:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F817E
	for <ksummit@lists.linux.dev>; Tue, 12 Sep 2023 00:23:17 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c0db66af1bso33665755ad.2
        for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 17:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694478197; x=1695082997; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPRxdQYWFbbSl+jHzMVmAydNP48vWrPe/8h3KIcG/lw=;
        b=pWxE7OlUsQjJ5i3zPW5pJH9jTUr7kVhKcCqVVEe6/3Ax+L/c7bxRPruMkob0VlgSsL
         ulMidudzUjCkmjRzFnYp71BeIzav/2K8+cW2RQU5BOrL7ylJNKDHH/nzwtR8ihKjpKKU
         FrrkOqe50652YLQ38vVr1Ybzz8te/z1tY9uoOC1godlYWAanD+eZJ2CII4Rq8O6SabTm
         aJiN1v/OgAYXAOHFRXOFQT6v/huXItsrBPzXtU9adGCX3FUMFGAWh4aD03fcMIjQSjO2
         2xsZxHixJyZs1vEDvhpcdH299o1bwC2JzleyYBGG82SiPXxc8AA41AC2a8EG6lWvIdWr
         p8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694478197; x=1695082997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPRxdQYWFbbSl+jHzMVmAydNP48vWrPe/8h3KIcG/lw=;
        b=XJlfDXj+/hlSKr7q2AKgp+QHSeXxYVAoSXZqAWkk/0JpOgqlaju5DpxDbZv0GwQTIW
         g4lcb+7Ski4qKJNX0VCeBrS0dGuzs5m/4Cgs9KrIdMlsvSxwPRzMzQj0Fj3UTA83w3c+
         jiKd1UKAAw42UoA3xJ9RUbLVAGD4fTIaA7ZF9I9pxLYl0R/M+OJPXLdBh6WGgx0iQPMK
         Dp6hdUZan35m/6s3yedawW5KhpYyW8bB1EURbuwVIYTjByKNlrdPUCmDeSIYU00DBL/J
         iOzUKes+6isBWHlgGX+xJbrZA4bGz4PCMkPu/I47KLpf822Ufs95h9pDiyIqaO9nWjPU
         KiiA==
X-Gm-Message-State: AOJu0Yxn/4/GdaZwepR1gAq3ZotenpUaOGGb7eoiRgm+w3P20u0EJgld
	vsXGUyP1xrvwdtXTekmeIyFEZw==
X-Google-Smtp-Source: AGHT+IFS5zLSL4VBgsFycphCfiFTrK4YLKRPjGCRN2XD6/1iVP8JzkDx3BIypwW0HdBlNiptjkSbug==
X-Received: by 2002:a17:903:486:b0:1c0:c7ae:a8a2 with SMTP id jj6-20020a170903048600b001c0c7aea8a2mr8212750plb.35.1694478196991;
        Mon, 11 Sep 2023 17:23:16 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id jd19-20020a170903261300b001bb0eebd90asm7106688plb.245.2023.09.11.17.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 17:23:16 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qfrBS-00E01A-0C;
	Tue, 12 Sep 2023 10:23:14 +1000
Date: Tue, 12 Sep 2023 10:23:14 +1000
From: Dave Chinner <david@fromorbit.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZP+vcgAOyfqWPcXT@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <ZPyS4J55gV8DBn8x@casper.infradead.org>
 <a21038464ad0afd5dfb88355e1c244152db9b8da.camel@HansenPartnership.com>
 <20230911031015.GF701295@mit.edu>
 <5dd21470139df5de7f02608f453469023f50d704.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dd21470139df5de7f02608f453469023f50d704.camel@HansenPartnership.com>

On Mon, Sep 11, 2023 at 03:03:45PM -0400, James Bottomley wrote:
> On Sun, 2023-09-10 at 23:10 -0400, Theodore Ts'o wrote:
> > On Sun, Sep 10, 2023 at 03:51:42PM -0400, James Bottomley wrote:
> [...]
> > > Perhaps we should also go back to seeing if we can prize some
> > > resources out of the major moneymakers in the cloud space.  After
> > > all, a bug that could cause a cloud exploit might not be even
> > > exploitable on a personal laptop that has no untrusted users.
> > 
> > Actually, I'd say this is backwards.  Many of these issues, and I'd
> > argue all that involve an maliciously corrupted file system, are not
> > actually an issue in the cloud space, because we *already* assume
> > that the attacker may have root.  After all, anyone can pay their $5
> > CPU/hour, and get an Amazon or Google or Azure VM, and then run
> > arbitrary workloads as root.
> 
> Well, that was just one example.  Another way cloud companies could
> potentially help is their various AI projects: I seem to get daily
> requests from AI people for me to tell them just how AI could help
> Linux.  When I suggest bug report triage and classification would be my
> number one thing, they all back off faster than a mouse crashing a cat
> convention with claims like "That's too hard a problem" and also that
> in spite of ChatGPT getting its facts wrong and spewing rubbish for
> student essays, it wouldn't survive the embarrassment of being
> ridiculed by kernel developers for misclassifying bug reports.

No fucking way.

Just because you can do something it doesn't make it right or
ethical.  It is not ethical to experiment on human subjects without
their consent.  When someone asks the maintainer of a bot to stop
doing something because it is causing harm to people, then ethics
dictate that the bot should be *stopped immediately* regardless of
whatever other benefits it might have.

This is one of the major problems with syzbot: we can't get it
turned off even though it is clearly doing harm to people.  We
didn't consent to being subject to the constant flood of issues that
it throws our way, and despite repeated requests for it to be
changed or stopped to reduce the harm it is doing the owners of the
bot refuse to change anything. If anything, they double down and
make things worse for the people they send bug reports to (e.g. by
adding explicit writes to the block device under mounted mounted
filesystems).

In this context, the bot and it's owners need to be considered rogue
actors. The owners of the bot just don't seem to care about the harm
it is doing and largely refuse to do anything to reduce that harm.

Suggesting that the solution to the harm a rogue testing bot is
causing people in the community is that we should to subject those
same people to *additional AI-based bug reporting experiments
without their consent* is beyond my comprehension.

> I'm not sure peer pressure works on the AI community, but surely if
> enough of us asked, they might one day overcome their fear of trying it
> ...

Fear isn't an issue here. Anyone with even a moderate concern about
ethics understands that you do not experiment on people without
their explicit consent  (*cough* UoM and hypocrite commits *cough*).
Subjecting mailing lists to experimental AI generated bug reports
without explicit opt-in consent from the people who receive those
bug reports is really a total non-starter.

Testing bots aren't going away any time soon, but new bots -
especially experimental ones - really need to be opt-in. We most
certainly do not need a repeat of the uncooperative, hostile "we've
turned it on and you can't opt out" model that syzbot uses...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

