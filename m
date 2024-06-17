Return-Path: <ksummit+bounces-1304-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07F90B213
	for <lists@lfdr.de>; Mon, 17 Jun 2024 16:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B7FA1C230A6
	for <lists@lfdr.de>; Mon, 17 Jun 2024 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467CB1B4C4E;
	Mon, 17 Jun 2024 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhfgSt0f"
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB419B591
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632090; cv=none; b=hoNQEbI74k4YWhYLm1BLhXwKQX8S2RmqrPfZy/6qhE4hLbl4mZNwfXxnefDOdC1j7qwKCQO99VOkN7lTO4Z4N4zZ6oCEibDgHb5JyJsIDppWpaN47nScR9epKjmq6vy2CJShj4ic99ODrKb7A64GRZcW96v5I/sXLQj6Nl5TYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632090; c=relaxed/simple;
	bh=cuU6yIlF7G+78NvSHhFp8ntpA7RUyAmtA6Qajh4TqXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAb/itiu/ICXX/zM74/kl9mKS+J8KZfnV8BBIe/qKwUJbSNhyFt5A2IXbBLELiV+df2VpoBw1/z1UTyzSPkN1saLEV19Q+GNIvGJ0qyrO1E0AUdJVGiQ69YuOxbZmg475BrVQb3RBsgiM4r9HDtLgjxjYH5SaM4X8r2OiAkJ9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhfgSt0f; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35f089e35e7so2773395f8f.0
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718632087; x=1719236887; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahyQtBJEmtmou/O9ZQ5JwVJ6Wx8XXbyrXuJfzSYCTlU=;
        b=yhfgSt0fiGMd7+HysXQMvTNac4jU97Q/SowfXn78AMXomKSB8JgmLRVyFnZsPP1nK5
         3WVqPx1zjsoJx6pDjA0iBSCbqSsjyoVoLD0re+cU11N+F1q7zmINH0ujx4U2jvbku7EH
         HiI02foRT/OHFKYPhl0hp74R+BPC793iFZX7/Uq+W/tyNJ3Thdi5qzMhZaoyuum+d1wP
         pHcfp97HWcZJwmVtODqvL8Bz6pxfifdm04DusOg8Eylnx3lR62quOgi/Z9Wq9nH/5orP
         ujLoKghVjRYP3HT/c1fmi9+az4c6mFdcWmHpAggUGbSy3/W1tx10dH3Iz+/fqKyZDzGs
         HWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632087; x=1719236887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahyQtBJEmtmou/O9ZQ5JwVJ6Wx8XXbyrXuJfzSYCTlU=;
        b=lbUYneo6x8SZTuwHzWLa4XYwxLm3BK9cxo1RRU7bdKVunWQ5cuLdZQcMzwk0cRmlaZ
         Y6J9/uSI4H9rsGpVMD60nc4j+L4v8hQkuYD2RL/kfpuAAeHMEktwE5HwMDi0ZWxxYE2F
         jEilUSp6/57UtL67pKVu5RIUgRJOHJNgDzW3G2WqSHBjQo2X7yMOGQx0nBAtURCCWYz9
         VUwINY3c6ykQIspmAPl07rr8UogVVPXmrSKQENQAB0n9JjvrMp0FdPmOeZ2V3u/2+gi5
         ToLUvTaCCuIvkDXnaFpsFxjZcLiw5t4OKEy+IJ77i1qoW4lb3vuro+iDZSuBfBEL+bOv
         JBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV+8WZ4D3U3L2EtUEXF6Adlz49/wpvrbFU7f7NG/58Yl2YBTGLWaFdAPs7pPSd1NPMgQ36LzzV2CMHkoomAF0X3Wh6/Tmp9A==
X-Gm-Message-State: AOJu0YxIWCWmnIaPh3aYVgKLYWKROX34Nyi39b+8aWjLxjtSIfh8BuH1
	jkQtg5jWRJHG9y2fGqy9/SCcmEtACoLpA7MAsfrSM4OMOWmHyUD7nw/27vcUJCY=
X-Google-Smtp-Source: AGHT+IE1A0ZRdCxpks76XoloK7ZQw035E9BBsDyvUPEh4oWKqnqeRTOil3Jhdg8kiI2fXeFOZu2tIQ==
X-Received: by 2002:adf:efc9:0:b0:35f:1c1c:e1e5 with SMTP id ffacd0b85a97d-3607a7c2cd3mr9847928f8f.31.1718632087268;
        Mon, 17 Jun 2024 06:48:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3608fb0b145sm5657936f8f.102.2024.06.17.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:48:06 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:48:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <f0850566-2fcd-4ce1-ac8e-a41ae70545ca@moroto.mountain>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>

To me, the explicit links to the lore thread are useful because when I'm
reporting static checker bugs, I can reply to the thread and CC all the
correct people.

I guess if we have multiple Link: tags then probably the last one is
going to be the link to the thread.  So that could work...

regards,
dan carpenter

