Return-Path: <ksummit+bounces-3-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445F364814
	for <lists@lfdr.de>; Mon, 19 Apr 2021 18:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 05EAF1C0F1D
	for <lists@lfdr.de>; Mon, 19 Apr 2021 16:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465612F9F;
	Mon, 19 Apr 2021 16:18:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682A2F9A
	for <ksummit@lists.linux.dev>; Mon, 19 Apr 2021 16:18:18 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id o5so36365490qkb.0
        for <ksummit@lists.linux.dev>; Mon, 19 Apr 2021 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=f4ycai9Fftfkq+uRJva5Jm4n53y6PnQD3cfEf0YyPes=;
        b=PvVyOKvzJ3TyoV5FT9Jjz1kio9MfwjyO+ETQfFMZSjWAfFgS73TCeaPMGYKuoVfHIs
         fOzz8dPrqb8FeYy0Ghr4Of1d+m99Ploye0uLi9eX9UhyQ30oFfjMHCvp8d3mtIZ/G6uX
         LXASjgPSBsupAtX9JOudchQcavsjjtVpxO+b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=f4ycai9Fftfkq+uRJva5Jm4n53y6PnQD3cfEf0YyPes=;
        b=Y4X94p0xQLui92B15EPq/K56Q9SxGnqgucgkdXtMHYp6IufmogYp38Oe5Alls+XXCX
         sSBDmsGo5dchOQm1/f/srpJmcsK0VFox2LKSlAN5GALqcHMLvlogugLPRtOii6+eu6Fq
         SGOiid9faioSkZImIWmsJ2/rJsWfzG7jqU3G3C7Y9/UWMkAvdxwO8Ngw6xnKFvy1nn2H
         tQwG1Mzfjz6NVl+zw49miTOdtcgIyh0rq5L/yLcEebulo+GshNwR4JU5jMC3en+68ERL
         ztIGUx8+R9W3m+X7SWnfQCxSzmuI/Th934En4KH7WzNxc/gj7L3KtxrJ62tQgDnXEbWK
         H3MA==
X-Gm-Message-State: AOAM531d79/ehEMvc+fjZzQ2kGy7xTv2GctF7+L/lxAlgA2b6OuhfLSn
	Vbejk/+wzjard9RyjXo+GPVEBYB+iwNGgKikr/o=
X-Google-Smtp-Source: ABdhPJy66MC5vD3Q4JmweMv9EKMrk7a54f7hDyQQ33E872BZXkE4vk8EnFgrWXPvwCTiCxQavNI4JA==
X-Received: by 2002:a05:620a:248f:: with SMTP id i15mr5637433qkn.26.1618849097525;
        Mon, 19 Apr 2021 09:18:17 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id l12sm9468834qth.72.2021.04.19.09.18.17
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 09:18:17 -0700 (PDT)
Date: Mon, 19 Apr 2021 12:18:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: ksummit@lists.linux.dev
Subject: [TECH TOPIC] Doing more with lore and b4
Message-ID: <20210419161815.ng5hp364x6mzucpv@nitro.local>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

While lore.kernel.org is a fairly new service, it has quickly become an
indispensable workflow part for many maintainers. Tools like b4 allow to
automate many aspects of maintainer duties:

- retrieving entire patch series
- tallying up and applying review trailers from thread follow-ups
- diffing re-rolled series against previous versions
- sending templated thank-you notes for applied series and merged pull
  requests
- cryptographically verifying patches for attestation purposes (using DKIM,
  PGP, and more)

This talk will review some of the above functionality that may be already
familiar to maintainers, but will also go through other features of
public-inbox, and peek into what is coming in newer releases, such as:

- how to mirror lore.kernel.org locally (in part or in full)
- how to integrate public-inbox sources into your automated tools
- how to use anonymous imap service for reading mail without subscribing
- how to use local-email-interface (lei) command to create saved searches and
  get pre-filtered threads from multiple local and remote sources into your
  inbox

Working with patches sent via email does not need to be frustrating or
insecure. We are aiming to provide a set of tools to further streamline this
process -- your feedback and suggestions are extremely useful and help
prioritize our efforts.

-K

