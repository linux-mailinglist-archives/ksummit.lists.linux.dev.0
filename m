Return-Path: <ksummit+bounces-477-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19F3F5559
	for <lists@lfdr.de>; Tue, 24 Aug 2021 03:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 12AD21C0F86
	for <lists@lfdr.de>; Tue, 24 Aug 2021 01:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65973FCB;
	Tue, 24 Aug 2021 01:06:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35C72
	for <ksummit@lists.linux.dev>; Tue, 24 Aug 2021 01:06:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j14-20020a1c230e000000b002e748b9a48bso878986wmj.0
        for <ksummit@lists.linux.dev>; Mon, 23 Aug 2021 18:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=nOtNLBcO/8//hcRdqSACO73P2To0oSj/c0kkozwO2AA=;
        b=XnldFTcYu/x9NPicLpk8k7BoE8deRA7BScgZZrHONMY+KCixm7Dlgt+cBth+OY6Xwo
         4XfKYZ39AK5/612zRDbLFiB8jznQsyvdxHNXR8/fI9PNSxR6nv66cDZDhNgsWRrCskFY
         UPS8q1E7041kyeUGNqmoSnJUNhMzY/8QY0U+1o1JNVTuautzrMOSl/kJOiCoWGtcd06v
         u7CO2B5Mb6MbPQ53zehTlH/yAhFk+SsZKEstbYsat+nJD9bDswNolDPRDnX1SI7iudN+
         l671/mt96GOarxSujhYUCY1HmrklOYs+Y/71KN+zNsBBjfKu8BaWPYULsFjnmrsxJeEz
         JkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=nOtNLBcO/8//hcRdqSACO73P2To0oSj/c0kkozwO2AA=;
        b=OmwACJOO/Pgb6lcS9eB9g8HRrTXQfUQEcOBjmxySbv1tOS03bV7z3gC4COYzFnfLsq
         JLnvY1VVhYeeaGOA0Y0qPciUhTuPyBBfpC6zyaCOQQqVnVs8LAbxj6l3mrDtRgUN1SfG
         IqbtQL1roJR3rY6cMfsmidNqnVo+tvgKcuD8b6h/r9Q90VaS9pVtdcyGUjxCPxEfX3N4
         Cv7HRSoh6e6djJL+ZzHxkcPBwoyKWsXkDQtttOw1Cqx7C+8DavMJ2mJ/5BJPmSKtNOEN
         a0dItBzce7YNl3amReImzfe0SP1LHMt12YGpR1lc1GxBe+GD88WTu6KTqFKRrwa74qYU
         m95w==
X-Gm-Message-State: AOAM531ySn4zQQAtZL8k9vPcEuBoCi0WyETF9hmpRx5tpadnox806VAg
	y7at9eLBAx23hevJqYIZAqTAjEcClEuQbsUH11nb2zPyJ3H58A==
X-Google-Smtp-Source: ABdhPJzSKTIdePdHTQrCJrtTKe3OLGcdOWDHD+JR8MLgNIe+old9PprGcpLpQbEH+Is0bEzOWmAs+zjTRCMZkjuw+KQ=
X-Received: by 2002:a1c:7ecb:: with SMTP id z194mr1359954wmc.182.1629767161397;
 Mon, 23 Aug 2021 18:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alex Levin <levinale@google.com>
Date: Mon, 23 Aug 2021 18:05:50 -0700
Message-ID: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
Subject: kSummit proposal - The Linux kernel in ChromeOS
To: ksummit@lists.linux.dev
Cc: Jesse Barnes <jsbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linux friends,

Jesse Barnes, Chrome OS baseOS (Firmware+Kernel) lead, and myself
would like to present the current state of affairs of the Linux kernel
on ChromeOS and the challenges we face, how we solve them and get your
feedback.  We can also talk about how our efforts can help upstream
development, for example by running experiments in the field to
compare approaches to a specific problem or area.

Shipping ChromeOS to millions of users that span across hundreds of
different platforms, multiple active kernel versions and across many
different SoC architectures, introduces interesting challenges:

- Testing the upstream RC on as many platforms as we can as early as we can=
.
- Updating the Linux kernel on existing platforms (millions of users at a t=
ime).
- Managing technical =E2=80=9Cdebt=E2=80=9D and keeping the ChromeOS kernel=
 as close
as possible to the upstream kernel.
- Current pain points in dealing with upstream.

We feel 45-60 minutes would be enough and will allow a discussion.

Thanks a lot in advance,

Alex Levin,
ChromeOS platform tech lead.

