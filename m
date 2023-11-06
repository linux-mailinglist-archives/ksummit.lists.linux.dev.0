Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7D7E2E6D
	for <lists@lfdr.de>; Mon,  6 Nov 2023 21:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0079280D5D
	for <lists@lfdr.de>; Mon,  6 Nov 2023 20:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9A02D7B5;
	Mon,  6 Nov 2023 20:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ud0AFzbQ"
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6F629CF6;
	Mon,  6 Nov 2023 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dPeS7DjfaOxr9GQOassiIBYJgUeMz1M5sZJbeEmCUFc=; b=ud0AFzbQJvuG9DUQPT6A6cO0dD
	VnOSTB0s2vbTVdxtyCFUYFp2SIwSbWidu8okdk8XudhsUYIZGKiBFJz4KDasRRvJDJg5PONMDzoj+
	PwLIh7ZAMM3stJZOH1Pqcbyy48aUuphg6E7nSJZRKzS5fPC4MG7IGxUeFFzz/LwksmqGOg491EhkU
	Tvs0yPfb9CraRUlNKXR+kHXNpmDacgixnamQ66S7wOZo9AjJdK24YMpYs/hj3rI8l5M0M+lf7nWB3
	ovimAl/xD3l69vjYFwR1GvqZ8q1RJ+MnVoVKANryn2yOD3nEIGiiBPLDFbXQLJC5VlaGQExbfhhR5
	ChsvA+6w==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r06aN-00HXiA-2a;
	Mon, 06 Nov 2023 20:52:39 +0000
Message-ID: <ab06f730-dff9-48a5-9ab4-672f96e569f7@infradead.org>
Date: Mon, 6 Nov 2023 12:52:39 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <572860847.59829.1699291390371.JavaMail.zimbra@nod.at>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <572860847.59829.1699291390371.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/6/23 09:23, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
>> - due to the sheer volume of messages, LKML is generally seen as useless for
>>  holding any actual discussions
> 
> I disagree. Of course I'm unable to follow all mail but I regularly
> browse LKML to see what's going on.
> Without LKML I'd have to subscribe to hundreds of subsystem specific
> mailing lists for no reason.

Ack. LKML is my primary conduit for any kernel email -- instead of using
multiple mailing lists.

-- 
~Randy

