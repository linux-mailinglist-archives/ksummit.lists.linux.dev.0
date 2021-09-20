Return-Path: <ksummit+bounces-620-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A564119D3
	for <lists@lfdr.de>; Mon, 20 Sep 2021 18:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BB3953E0F38
	for <lists@lfdr.de>; Mon, 20 Sep 2021 16:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E643FCB;
	Mon, 20 Sep 2021 16:30:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C1E29CA
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 16:30:25 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id e16so5250047qte.13
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 09:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fX1NIYok2togq/y1xR8/yZsYJ2HZag+RJZGr+2D3pS4=;
        b=doNi+RCiM+IWnVuAqKdGGfczTCCKqWsh9dMlPaNlqH8s4vQdO2eHkFnk5WGh8QH44Z
         H8QSF9i2TBc5SYZXEJDYO1bUcgtuCIJHExnSjIpAWZfdxSyzJ/o6mphdCVnC31lh+cX0
         1beilVMYVoTWQly8UMrcfGVtGQHw8aorilT00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fX1NIYok2togq/y1xR8/yZsYJ2HZag+RJZGr+2D3pS4=;
        b=DJXU9fFEDWWuTv3DLrcXPNq4/ShJvlNXEUnVD4aHO9X/p7o73UJO3Aq7CA5N1Cmffw
         DVjKG5WrFzird63ISMv67FbgSmfKR1TreA/kCTOREd6liTyANyzHvJtsNt7IP9ibfq7P
         cFKK4Rizy5Ct0RH7iUvAB+IvN7qElSEUzzHLvBtcscg4v2/v4fDnznl2dG8VGsHtQiEZ
         7jEhlXP7BL8v5Wl314oqLmMXujh96REKapaf0VAUJyeGrX60aPj1Z2nZsTUQa7xHX5c4
         6RbbjB05dk6HhVLWOb3Drn6kEak4f2IfL5I2lz6FYCnUJlAhNcUGP1cPzk1VlXi6pNsK
         Bhvw==
X-Gm-Message-State: AOAM530yvcCk3e1bC6DTv0ELu58HwGqu2u1yGu2a+PqPaFdOl4EHILKs
	+YEvv6yJn6tRLPTS8ImBm3F4uPX85n01ESXz
X-Google-Smtp-Source: ABdhPJxvN7B6ZMgC+p9GXlJoRJb1SqSHUKQprmWvBBvop6H7cXYqtvysHnyJO6JdtAvnbSkaTQTCWw==
X-Received: by 2002:ac8:5617:: with SMTP id 23mr23598396qtr.20.1632155424161;
        Mon, 20 Sep 2021 09:30:24 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id c19sm3572181qkl.63.2021.09.20.09.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:30:23 -0700 (PDT)
Message-ID: <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name>
Date: Mon, 20 Sep 2021 12:30:23 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Hansen <dave@sr71.net>,
 "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>, ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
 <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
 <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name>
 <20210920162329.GJ4192@sirena.org.uk>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <20210920162329.GJ4192@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/21 12:23, Mark Brown wrote:
> On Mon, Sep 20, 2021 at 12:18:09PM -0400, Laura Abbott wrote:
> 
>> Yes that is correct. We attempted to consolidate e-mail addresses if you
>> contribute under multiple ones. This is a pain point we will need to fix
>> next year.
> 
> Will we be getting some futher mail when we should vote?  I opted in but
> didn't vote at that time - I saw the vote was listed but didn't realise
> that voting was open since people still seemed to be nominating.
> 

Nominations are now closed and voting is now open. Please vote at your
convenience.

Thanks,
Laura

