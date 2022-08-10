Return-Path: <ksummit+bounces-759-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9D58EE17
	for <lists@lfdr.de>; Wed, 10 Aug 2022 16:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BEE61C20972
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794B0291F;
	Wed, 10 Aug 2022 14:19:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67628F1
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 14:19:26 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id v2so11040629qvs.12
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=mz01cefWYS78sm+oMQJwFiT4rIFjCsP74KB4CJ+fRrk=;
        b=S0TYM8gcjsByCNjSWIU41rmvIX3jlSq9AI5YeLAU8nr8nTasvyhcEisX2wSq+jwTgC
         uzmj8WqnXLOdL62+6Pns0khVX8s7ZFWYL8ovlB7pUQnCiruLzrxWdhrGydh+y7L7acT8
         +eSxui0hIf11aSfmwrCxHQdI4gYZXzNDJzw7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=mz01cefWYS78sm+oMQJwFiT4rIFjCsP74KB4CJ+fRrk=;
        b=h0rZKEyXGzDo5kCl0a5bqKztikGCQfE/t+apRQbrO/olnwJmEX4bcmJEgqcT73DQzT
         dmsS8q88bwcbcB4Kk8bgpOR5HiurhxQMacdDtdAr1LMsbzpvfZoYoGhOlwuquml8fKOc
         B40drk0GRhvCG7HKFU3+6w0Fgl+7eO+EYjL/mBx+K0Pw0a3CnQVs8/x4Jzmxe4ryxPUJ
         3rFfx8K/QjViriIT71nMCLstjLoN7dJAf8ZpnRtAtPW5EkKKfdWOwaTMrxeJV1gPlMMk
         y1dQW2//7p4kAkCTpNTUYNsCWIqTURVElQoDYIS/rZBFqmYHqlliaybXIbDDg1Poi/Ea
         5RQQ==
X-Gm-Message-State: ACgBeo1deKU+n7lq1eXZwz6WQ+Mmu08EfiklkDPaNXiFF6yK3O6auzjA
	oGJb4krvQr+LpH1Ngk8tjhvXXQ==
X-Google-Smtp-Source: AA6agR543q3jSocGttlrEnjzQdjfxCJ8YwGulxsSuZdsqBWXW6VqVRex/HY4K9aWD1NMxAfJBNj+Hg==
X-Received: by 2002:a05:6214:1c8c:b0:473:408f:ddd6 with SMTP id ib12-20020a0562141c8c00b00473408fddd6mr24650792qvb.74.1660141165649;
        Wed, 10 Aug 2022 07:19:25 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id l16-20020a05620a28d000b006b9a24dc9d7sm1372686qkp.7.2022.08.10.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 07:19:24 -0700 (PDT)
Date: Wed, 10 Aug 2022 10:19:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robherring2@gmail.com>, Lee Jones <lee@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Lee Jones <lee.jones@linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <20220810141922.jt6fw2xoskw2bksh@meerkat.local>
References: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
 <YvO6LY3kE02/uvXe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YvO6LY3kE02/uvXe@sirena.org.uk>

On Wed, Aug 10, 2022 at 03:01:17PM +0100, Mark Brown wrote:
> > You've got to filter out what you want on your end. And lei is great
> > for that.
> 
> lei is too new for Debian stable :/

We also have plans to have centrally-managed lei filtering, available via
read-only mailboxes. This way "trawl all lists for relevant messages" can
happen on the kernel.org end and maintainers can make use of pre-filtered
data.

-K

