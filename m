Return-Path: <ksummit+bounces-169-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8B394318
	for <lists@lfdr.de>; Fri, 28 May 2021 14:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 483191C0E6F
	for <lists@lfdr.de>; Fri, 28 May 2021 12:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6BA6D11;
	Fri, 28 May 2021 12:59:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F17D70
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 12:59:36 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id t17so2561338qta.11
        for <ksummit@lists.linux.dev>; Fri, 28 May 2021 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QPVT+rc6KLzw0WFJPKNFgwBHHm57Z4uamjVVBBbTkRs=;
        b=KW5YYgBzRwP2FW7FeiiJ7bt//RyFLDdp1phHVN1OLN0kjlo+HXLjTBvoiumBhGrFi0
         +SOUHPXzfriu51CI+hqnZGwcAaH7okyLzVg6pOmKOTndBuN9bqSBvCswE86RMx2Xl5wG
         cwms4jpZJz+yaNF2tGajmQAjP67FmK0iAtPykT4bxzM0RZ5r0j0ajqsZ6bVHvUSqb5zg
         FQ8r3sUVMQW/4325iHNYLpMnE2/3GDvszMtuKutw5Oe5vhymAvQAyFcygfJRy8EztlBt
         z/xO/VBovj5m0F2YpPZICxo/STn0bPh0p+zjzfyls94JcqxG0cv2pc5MtKUU4EPfpIK6
         O7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QPVT+rc6KLzw0WFJPKNFgwBHHm57Z4uamjVVBBbTkRs=;
        b=ByEmELIjh+B20ceOS6pf98IhEVsNI2o8ChBXsoDCuqLT0+iTpdWl78BuD0Sxk5ahnn
         pzAT8ssiyURbhzEm/DfWV8HudI1n4Q84rSUgridb4jA2TcE6MzwKFMCYaYKlZ89d9q3r
         eB6bhAC7zEtsP7WPCUIu2mVx8LXGNVHLeYYIbVpVrDs70vShOae1zk9D6Y08trlUGtGh
         IpfLpn7OFoj2hPfQaJyOMoB9JJass/3s5ej4naFo9ambkwk+3EHyzklC5h39dJXQFnXz
         8Zd1Qm+EIwCiJE2nLR0a5UHtp/HRiE5XCt2taZPH7Z9Ib8vxy3F44tlLYpwny0Fbt4Pr
         XaWQ==
X-Gm-Message-State: AOAM5320YmMIx3jeMNvI74R1nfbnNS0q9PX9hq7fMZ6g9vMWJCQvOz4q
	ikzqi4pL+MYz9UvKWvFXF8SMG9LvBQ49bg==
X-Google-Smtp-Source: ABdhPJxDPk8NNQ/2vDNUxT942NteKLU7LX6MlI6TOQooelHDQztK78T8M7ltLUhXav4cIoUXBSnxnw==
X-Received: by 2002:a05:622a:392:: with SMTP id j18mr3275811qtx.29.1622206774945;
        Fri, 28 May 2021 05:59:34 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id y12sm3200855qtv.59.2021.05.28.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:59:34 -0700 (PDT)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: ksummit@lists.linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [TECH TOPIC] Writing a fine-grained access pattern oriented lightweight kernel module using DAMON/DAMOS in 10 minutes
Date: Fri, 28 May 2021 12:59:23 +0000
Message-Id: <20210528125923.9231-1-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528124125.9051-1-sjpark@amazon.de>
References: <20210528124125.9051-1-sjpark@amazon.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>

From: SeongJae Park <sjpark@amazon.de>

I mistakenly sent the mail to ksummit-discuss@lists.linux.dev, not
ksummit@lists.linux.dev.  Sending again, sorry.

---

DAMON and DAMOS
---------------

DAMON[1] is a framework for general data access monitoring of kernel
subsystems.  It provides best-effort high quality monitoring results while
incurring only minimal and upper-bounded overhead, due to its practical
overhead-accuracy tradeoff mechanism.  On a production machine utilizing 70 GB
memory, it can repeatedly scan accesses to the whole memory for every 5ms,
while consuming only 1% single CPU time.

On top of it, a data access pattern-oriented memory management engine called
DAMON-based Operation Schemes (DAMOS) is implemented.  It allows clients to
implement their access pattern oriented memory management logic with very
simple scheme descriptions.  We implemented fine-grained access-aware THP and
proactive reclamation using this engine in three lines of scheme and achieved
remarkable improvements[2].

As of this writing (2021-05-28), the code is not in the mainline but available
at its development tree[3], and regularly posted to LKML as patchsets[4,5,6].
Nevertheless, the code has already merged in the public Amazon Linux kernel
trees[7,8], and all Amazon Linux users can use DAMON/DAMOS off the box. We are
also supporting the two latest upstream LTS stable kernels[9,10].

Agenda
------

In this talk, I will briefly introduce DAMON/DAMOS and present how you can
write a fine-grained data access pattern oriented lightweight kernel module on
top of DAMON/DAMOS.  With the talk, I will write an example module and evaluate
its performance on live.  A data access-aware proactive reclamation kernel
module for production use will also introduced as a use case.  After that, I
will discuss my future plans for improving DAMON and improving other kernel
subsystems using DAMON/DAMOS.

[1] https://damonitor.github.io (https://damonitor.github.io/)
[2] https://damonitor.github.io/doc/html/latest/vm/damon/eval.html
[3] https://https://github.com/sjp38/linux/tree/damon/master (https://https//github.com/sjp38/linux/tree/damon/master)
[4] https://lore.kernel.org/linux-mm/20210520075629.4332-1-sj38.park@gmail.com/
[5] https://lore.kernel.org/linux-mm/20201216084404.23183-1-sjpark@amazon.com/
[6] https://lore.kernel.org/linux-mm/20201216094221.11898-1-sjpark@amazon.com/
[7] https://github.com/amazonlinux/linux/tree/amazon-5.4.y/master/mm/damon
[8] https://github.com/amazonlinux/linux/tree/amazon-5.10.y/master/mm/damon
[9] https://github.com/sjp38/linux/tree/damon/for-v5.4.y
[10] https://github.com/sjp38/linux/tree/damon/for-v5.10.y

