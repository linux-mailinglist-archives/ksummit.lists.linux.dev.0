Return-Path: <ksummit+bounces-924-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A49EB5F491A
	for <lists@lfdr.de>; Tue,  4 Oct 2022 20:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE491C20934
	for <lists@lfdr.de>; Tue,  4 Oct 2022 18:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EBB4415;
	Tue,  4 Oct 2022 18:13:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E8440F
	for <ksummit@lists.linux.dev>; Tue,  4 Oct 2022 18:13:54 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id hh9so250061qtb.13
        for <ksummit@lists.linux.dev>; Tue, 04 Oct 2022 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=fO/JpHdHbnnGpQX04F/Oau78NLCRz1vfsBMEmZ0J96s=;
        b=BW6Bo4ze8wD19cbDxt8TiUs9VLD1QqH9rpg3o/xgk1nPXJNcmTYJ64Rd6cDFQywsTL
         9tGXIi++p5a+JHI0WzU183a9PAyucjUtwyfM2w6CJuW3Ek28NYppARmlAE5D3+6SdDhp
         TNuq+7V6DGg/ZMrezLHgoUCs9CGAMXQ1iy/Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fO/JpHdHbnnGpQX04F/Oau78NLCRz1vfsBMEmZ0J96s=;
        b=7cxts6A1YjSKYXDOKjHAekL/Et61FgMHxF65sMCg4M48SKJsFProBLb+p+qZ1kyqAd
         j9d9bB8VBxerjkl/RGsbZm2h8YqejmTFgh0yIiCjI97rvFdYlWpMv+Mwl2YP6IjyxZti
         yhhuxdVwfgOBT2CPvA8mA/oRajsDsqisKtGJINWO/zMf2HukG7/Em01+og7VAuHZQNrx
         DedZWv53OvLgNZvLyLu89PEmFE+iNFgjAsfKVKHimSkNrF0g1KZGvv8GG0msYAu9pkPZ
         pXNG5cLHDeynxyOjz8+RcZseqYYp2JX3n1Lbi0d9WJrGe3s99oAUlIMH25pAB+QcVOu6
         vNMQ==
X-Gm-Message-State: ACrzQf1+7+8rHLc2TmLRlcLM6dWoLx8yIfOCeVtYMqjgS3c4XZOxnJn7
	eVujsDi1MAwsu1ZpRXgSRHVMuQ==
X-Google-Smtp-Source: AMsMyM5JEAqaJhIKfRWcIEj6aYLtImfVjjElMtuKTwbwOWUWhsy7eLLseBrc+agUN30m1MLSUppbdQ==
X-Received: by 2002:a05:622a:1146:b0:35b:afe8:5c9c with SMTP id f6-20020a05622a114600b0035bafe85c9cmr20301900qty.54.1664907233859;
        Tue, 04 Oct 2022 11:13:53 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x188-20020a3795c5000000b006bad7a2964fsm14192403qkd.78.2022.10.04.11.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 11:13:53 -0700 (PDT)
Date: Tue, 4 Oct 2022 14:13:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"Artem S. Tashkinov" <aros@gmx.com>,
	ksummit <ksummit@lists.linux.dev>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004181351.qyvu42ytkka3ep3m@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <Yzx1T05Ut0of55KY@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yzx1T05Ut0of55KY@kroah.com>

On Tue, Oct 04, 2022 at 08:02:55PM +0200, Greg KH wrote:
> On Tue, Oct 04, 2022 at 01:53:54PM -0400, Konstantin Ryabitsev wrote:
> > As I have stated multiple times, the hard part will be keeping a team of
> > people who are willing to do the bug triage work, but maybe we can start with
> > Greg KH using his intern funds to hire someone (assuming he's not already
> > using these funds for someone to help him with all the other tasks).
> 
> I have no interns anymore, and the ones that the LF does have in the
> kernel program are using all of the remaining budget that we have, so
> much so that we have a whole bunch of unpaid ones at the same time as we
> have so many people applying for the process.
> 
> So I don't think you can use those funds, they are all spoken for,
> sorry.


Yeah, I wasn't actually serious about the interns. An effort like this needs
to have a separate fund allocation that can't be cannibalized for any other
purpose.

-K
[Fixing the ksummit address]

