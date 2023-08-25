Return-Path: <ksummit+bounces-1066-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF5788092
	for <lists@lfdr.de>; Fri, 25 Aug 2023 09:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 868B01C20F51
	for <lists@lfdr.de>; Fri, 25 Aug 2023 07:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C771C02;
	Fri, 25 Aug 2023 07:05:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86FE17EA
	for <ksummit@lists.linux.dev>; Fri, 25 Aug 2023 07:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FD0C433C7;
	Fri, 25 Aug 2023 07:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692947135;
	bh=56XyhcbtLQ3KE/hH1Yuc9htcKXlFa/kCggBa0V1yxSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jZnusHjcxfymFK6ASBQkh3lC/v3Z+OwNAiyvftQkD30lUYI4PgZaIIKA+dRF8oUzE
	 wSZ1hYUv+2Cn1fH2tkMtqkPsB8//F4ZbZsHkKb5taeAK0o9dxwOhiFJox8kkG3SS45
	 QaMcKqdZ/YjBIKYRHiJ5vGgKUHqs/dxdT07Djajb7/5KlS7nJL6bldjyLUSuIR9k6y
	 ZMC/NmtAW7D1CkSEyqsziWeW2gUTGgmqseQmQxvvnHTpjIVGAuxMS1jDWmuoLUsDEk
	 nKP5ys9q11XRcR5h/lxxv2Ein+fPNfWlfxi0zHrdbs5Howl6eHlE6+sCEwrs3epmeP
	 AvP0k8DKgkHPQ==
Message-ID: <7a692436-3643-4a12-95b2-3decb38cda89@kernel.org>
Date: Fri, 25 Aug 2023 09:05:30 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 ksummit@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 Song Liu <song@kernel.org>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com>
 <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org>
 <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
 <20230818152629.GA13558@pendragon.ideasonboard.com>
 <20230824223009.5d4ad0a4@jic23-huawei>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230824223009.5d4ad0a4@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/08/2023 23:30, Jonathan Cameron wrote:
>>>> We're trying to encourage active developers to be code reviewers as well
>>>> via positive/negative scores:
>>>> https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/
>>>>
>>>> It doesn't help much yet. All incoming kernel contributors assume
>>>> that it's a maintainer's job to do code reviews.
>>>> Developers just send patches and wait. It doesn't occur to them that
>>>> reviewing other patches will help them land their own.  
>>>
>>> The DRI/DRM community has group maintainership that works a little
>>> bit.
>>> Essentially it boils down to ask people to review your stuff and you
>>> will review and also merge their stuff in return.
>>> Sometimes this works.
>>> Especially if you are a circle of acquaintances working full
>>> time on similar things, yay! So much support.
>>> When you are a sporadic contributor it doesn't work as well.
>>> Because you cannot always find some matching contribution to
>>> review and you feel like begging.
>>> So different solutions for different contributors may be needed.  
>>
>> I've also experienced mixed results from "trading reviews". It's
>> certainly nice on paper, and it works sometimes, especially when asking
>> contributors to review patches that are directly related to their
>> business interest. I remember asking a contributor from a large company
>> to help me with reviews, to free some of my time to review their
>> patches. 
> 
> Personally I like to point out to our kernel teams that if a maintainer
> is ignoring you (too busy), the best thing is to help (guilt trip) them
> by reviewing anything else you can find they haven't gotten to yet.
> Added 'benefit' beyond learning more about the area is you often end
> suggesting changes for the other outstanding patches resulting a new version
> of their patches that is further down in patchwork or similar so maintainer
> tends to get to yours quicker...

I'll start responding with this to pings on LKML. I think Greg already
does for some cases.

Best regards,
Krzysztof


