Return-Path: <ksummit+bounces-1161-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A67A6978
	for <lists@lfdr.de>; Tue, 19 Sep 2023 19:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB0C1C20A4A
	for <lists@lfdr.de>; Tue, 19 Sep 2023 17:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC403716F;
	Tue, 19 Sep 2023 17:15:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541A8814
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 17:15:55 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c0179f9043so33260541fa.1
        for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695143753; x=1695748553; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/DYm89xKha5hIifMM4jmGfL4V1kBTUvXfrruUWsBFU=;
        b=Ortz3E25cS+rZiNC35P8w5LZCFfdyxS5P3JAwUsuUXeu+uiaB88IRtWho09X/H8qxo
         AqxzXbaduQliXQGem6+SgW4Pwy++lXl+6fItUXyxWNnrJ2httJ64LRuDkgB7hCsb8DAf
         rhtbUctCGtDb7r75Hx9PHDmNMZggHmBHp7JXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695143753; x=1695748553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/DYm89xKha5hIifMM4jmGfL4V1kBTUvXfrruUWsBFU=;
        b=XRabh4w9/uWVu70XFffAOnazFVsHbKeJ75OWlwzbmoqh9z/UXl8j4pTFlpPHQbWMoR
         BRqPFic1Rr3FpGr8ejdlV/sAUGSYobcX6vUsykV+y46bb0CUe3rUZM7RR8gMa00lhpHl
         h4rKbQM5HfwNfKkdmNLnzF9MBp2Td292fXEHkm+/DljeL49d8SWsZLlsVoTim9k4i6+u
         Yh2uHBB0rjJX6VvR6vBa3ib3aoVYdd6T8JUyXE1euCcuou/kQJmWmhPrTSMa+yaWNvh1
         60yqvEDUmq9CJC7QDcj6vpopifEa/mZ9PY/9ivr+DVahDzlHUyZKr3Yjovw7rylCYi7R
         yIwQ==
X-Gm-Message-State: AOJu0Yy9sk6yX5m8jlntaYTlVJwRzWHDInHeFeBRYvui2pkc5m2RZQPk
	9MD1cTfm4uULKII7If2sWxRi4RT/xrW/E/Pot/hWGgTX
X-Google-Smtp-Source: AGHT+IHR8Tb8uHhqIHRLUaZAJAu6+Ma7vKTScyHRoRRsuxpwVrsJniAqsTC7rMnWy1APqV/yvVUOQA==
X-Received: by 2002:a05:651c:235:b0:2b9:b27c:f727 with SMTP id z21-20020a05651c023500b002b9b27cf727mr99854ljn.8.1695143753404;
        Tue, 19 Sep 2023 10:15:53 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id e18-20020a2e9852000000b002b9cc2f5c39sm2712069ljj.37.2023.09.19.10.15.52
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 10:15:52 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50336768615so1070789e87.0
        for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 10:15:52 -0700 (PDT)
X-Received: by 2002:ac2:4186:0:b0:501:b97a:9f50 with SMTP id
 z6-20020ac24186000000b00501b97a9f50mr245158lfh.65.1695143751987; Tue, 19 Sep
 2023 10:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230907071801.1d37a3c5@gandalf.local.home> <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area> <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <ZQj2SgSKOzfKR0e3@dread.disaster.area> <ZQku4dvmtO56BvCr@casper.infradead.org>
 <ZQnNiTfXK81ZQGEq@mit.edu> <ZQnQMobKwIbBTL9h@casper.infradead.org>
In-Reply-To: <ZQnQMobKwIbBTL9h@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 19 Sep 2023 10:15:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNP7uXWcpGe7Owp-TePruH_S3jH38h=W2-YvbD9Mgz_Q@mail.gmail.com>
Message-ID: <CAHk-=wgNP7uXWcpGe7Owp-TePruH_S3jH38h=W2-YvbD9Mgz_Q@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Matthew Wilcox <willy@infradead.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Dave Chinner <david@fromorbit.com>, NeilBrown <neilb@suse.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Eric Sandeen <sandeen@sandeen.net>, 
	Steven Rostedt <rostedt@goodmis.org>, Guenter Roeck <linux@roeck-us.net>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Sept 2023 at 09:45, Matthew Wilcox <willy@infradead.org> wrote:
>
> What I was trying to say was that if the buffer cache actually supported
> it, large folios and buffer_heads wouldn't perform horribly together,
> unless you had a badly fragmented file.

I think it would work in theory... I don't see a _practical_ example
of a filesystem that would use it, but maybe you had something
specific in mind?

> eg you could allocate a 256kB folio, then ask the filesystem to
> create buffer_heads for it, and maybe it would come back with a list
> of four buffer_heads, the first representing the extent from 0-32kB,
> the second 32kB-164kB, the third 164kB-252kB and the fourth 252kB-256kB.
> Wherever there were physical discontiguities in the file.

That *is* technically something that the buffer cache supports, but I
don't think it has ever been done.

So while it's technically possible, it's never been tested, so it
would almost certainly show some (potentially serious) issues.

And we obviously don't have the helper functions to create such a list
of buffer heads (ie all the existing "grow buffers" just take one size
and create a uniform set of buffers in the page/folio).

                 Linus

