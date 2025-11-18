Return-Path: <ksummit+bounces-2621-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD02C6AF99
	for <lists@lfdr.de>; Tue, 18 Nov 2025 18:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AE8A3C0B5C
	for <lists@lfdr.de>; Tue, 18 Nov 2025 17:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AA131ED82;
	Tue, 18 Nov 2025 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="UWDTaptH"
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B131ED6C
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486347; cv=none; b=sQJ3wCuSECYjhJWoCz26OtKwNU6vymEybya+ezQ3zoL5Vo0iOTqqJVXf4GsBOB2S6hVU2kIZU1ZUBKwylC1jJ+mzwrFSsgVjf4xMPe9pWS2XAAQlfWWLGdufd+lLUY+bj4kc/RcAWmztjRCyVoEckwd+1H1HO7H59XdD0kOPAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486347; c=relaxed/simple;
	bh=rtLOLxCkT0OhPwpdB5/CwRCiZGezlpyVC+mgf/oIhK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJ8Hazz84Ex//xqDGg9gdh4244ZMSw7NwMeYq95Ghitt45/e8WZehB8Mles/eljHDadVy/pYeK+T6DTSRtgVnuu0R8VkBqfyYyHkPNa6WGE50Sflb/qHutqP3uJ9nkO9vnH1Ls4Bd4+k++IP7Kg3IPNeEfPB2gbpnen7gG1G/j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=UWDTaptH; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4d9rtn6YQSzlv82J;
	Tue, 18 Nov 2025 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1763486336; x=1766078337; bh=YpBgM8v9K4aB3JHaQgR5PO4p
	Cqbelo/55uxiDeGlj7o=; b=UWDTaptHQfV0A2SpBgHcLszVDxQ2cJpNNqnjV7fr
	AuzPOMBbKJNlpNGaZxLtmuWjRXgAZrw+ogDOf0w96JqqViM2NMyXwRBx/FuvCGgI
	6s2vWQPuqvinMwt2phV4yr9BKlnqdrc9T/pHDZLSo3lLS1s7DhnMewfh6YFQtzwY
	YnJIRvgu6oyNhI3oYttkKNlAiYOKysdfIfuu0i446lcDDvkRNglzkfXr5ri1AU23
	MEGeKQ4/hGnBeurI1pNLijWqnALjYWu4uoQk/06X1pMYUt1GiV2qFsIuQtWIlIX2
	OEsNUXAmo6DzfU/ykqyQk/BWOp7JycZc1W/vxi+dA8X6Pg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id N4onLChKH34H; Tue, 18 Nov 2025 17:18:56 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4d9rtj30DyzlrnQ7;
	Tue, 18 Nov 2025 17:18:51 +0000 (UTC)
Message-ID: <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
Date: Tue, 18 Nov 2025 09:18:50 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 8:39 AM, James Bottomley wrote:
> The problem specifically is this added comment in cleanup.h:
> 
>>   * That bug is fixed by changing init() to call guard() and define +
>>   * initialize @obj in this order::
>>   *
>>   *	guard(mutex)(&lock);
>>   *	struct object *obj __free(remove_free) = alloc_add();
> 
> Which is recommending mixing declarations and code contrary to our
> prior rule.  I note the rule against mixing variables and code was
> relaxed in the C99 standard (and in a lot of other languages), but
> we've never formally changed our coding rules.
> 
> I'm not saying we have to stick with C89, just that if we change
> adherence to it, we should do so globally and document it because
> having incosistency for __free vs other variables really isn't a good
> idea.
A related question is whether or not to allow declarations in the
initialization expression of for-statements. Although some maintainers 
reject patches that use this C99 feature, apparently this feature is
already used extensively:

$ git grep -nH 'for (int ' | grep -vE '^Documentation/|^tools/' | wc -l
    1239

Thanks,

Bart.

