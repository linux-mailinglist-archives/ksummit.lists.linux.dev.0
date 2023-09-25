Return-Path: <ksummit+bounces-1188-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B17AD9D2
	for <lists@lfdr.de>; Mon, 25 Sep 2023 16:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 54F7D2815F9
	for <lists@lfdr.de>; Mon, 25 Sep 2023 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D561BDF2;
	Mon, 25 Sep 2023 14:14:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E263D6
	for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 14:14:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-405361bb94eso65297895e9.0
        for <ksummit@lists.linux.dev>; Mon, 25 Sep 2023 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695651252; x=1696256052; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQq/BqSoldA8+HkQXbEK/xXi8jrjFiaKILJ9T9QlK0o=;
        b=hWnPyICh3LH15V9mN+q+r1twblotnVhez54tGXXzrZM9l0YuDTNx4OzjPB7Um27apg
         PKj9K2J4BicdRaH1WJzUGYkk5NiVoEzbmf2Fdmp1m0iEnP+5BDJEfHlwXaFMymx8Z3hx
         +W90PPFq0DXOLSCM3rqHmEEB4cwPelhjeuLKxlIVu/HuqxDiQsBQ/gRen6aI+P2G6alL
         Y0vE+8NNJq0xIuT3Jzz1LxuDoMkX9L+3YoYG3Ll692e9ISjz9dxCLEusF9tYRGptCND/
         9t72fAPoKfS0KFNNM6EYEUDEA6qZogJYQ3Y5J1XLx9nWjfWHFX/ddoXhz23oBetb370j
         S3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695651252; x=1696256052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQq/BqSoldA8+HkQXbEK/xXi8jrjFiaKILJ9T9QlK0o=;
        b=Jbh17vMwIojT6tYmwiw4x3m7c5WhUpIeL/+WSSQy5IQerKHQst0vsKb2gFAm+rVy+H
         aFfZ27+lz+DAF/dw4+J1ooTMC9FWRtD6KmPK/2/TCH050Je0/UT9V0RPJPqtYzYLqoGp
         BndDh4v7priemeVVsqXRTqlbKHnLcaNFpKQFQS+o4gE5dyECjw7XO5sb1ry5nc7xczHZ
         3nuAtGIt3xErS9z2MqE6WPItYRpOh2G807KfCeiUntamrA5CyTY4Hn67EIX6l9PizdZk
         ffHPylrBF/vKmw0TflHAgsDkV5E4XH38Md2/X/wZOTk6cOeup0QtM1Ru3mmRgHu5B1Iw
         zqbg==
X-Gm-Message-State: AOJu0Yxb04D3k2Pqv+st+qjK4qNmaWVxgBTmZSkj4ltdctFGtCrKhzrl
	rhlcNcCawXHB8DSA59sVcL4l/w==
X-Google-Smtp-Source: AGHT+IHUVb+vo/W+27VYRqqrkX6MmlMh6Bm5zqYmDI9ffn0TT8EMbIgHkXOfOzbwguwBLO3KCIaZHA==
X-Received: by 2002:adf:f48a:0:b0:31f:f1f4:ca85 with SMTP id l10-20020adff48a000000b0031ff1f4ca85mr6035329wro.37.1695651252387;
        Mon, 25 Sep 2023 07:14:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j13-20020adfd20d000000b003232c2109cbsm2074379wrh.7.2023.09.25.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:14:11 -0700 (PDT)
Date: Mon, 25 Sep 2023 17:14:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dave Chinner <david@fromorbit.com>,
	Guenter Roeck <linux@roeck-us.net>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <f02917bb-db26-46b8-899d-9a3571682583@kadam.mountain>
References: <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
 <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZRFVH3iJX8scrFvn@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRFVH3iJX8scrFvn@infradead.org>

On Mon, Sep 25, 2023 at 02:38:39AM -0700, Christoph Hellwig wrote:
> On Wed, Sep 13, 2023 at 10:03:55AM -0700, Linus Torvalds wrote:
> >  - syzbot issues.
> > 
> > Ignore them for affs & co.
> 
> And still get spammed?  Again, we need some good common way to stop
> them even bothering instead of wasting their and our resources.

A couple people have suggested adding a pr_warn() in mount.  But another
idea is we could add a taint flag.  That's how we used to ignore bugs in
binary out of tree drivers.

regards,
dan carpenter


