Return-Path: <ksummit+bounces-930-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC025F521F
	for <lists@lfdr.de>; Wed,  5 Oct 2022 11:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DEB280BD9
	for <lists@lfdr.de>; Wed,  5 Oct 2022 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27910136B;
	Wed,  5 Oct 2022 09:57:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063C63C
	for <ksummit@lists.linux.dev>; Wed,  5 Oct 2022 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664963843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20ff7s16mtIwZ8gqYFObUPuSeBfntjdVTNqXHSuaHoI=;
	b=ZHYb3YcMK25WqNfJAfeTatUL5AnNUaSbj0VBqUWUr12vqKNhi6oMO+hTYkPwu6nvpf5h19
	afP5BrzWgQVU45sy32Q9DDypiOZccULssRZ/tioED2299Dojo+asB7+cz4N6QmCUa+wMXY
	cT/9dBKKaMKV5m1OqITk9+O13cj4UYc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-jh7hhplOO4in0S_W0JDLZw-1; Wed, 05 Oct 2022 05:57:21 -0400
X-MC-Unique: jh7hhplOO4in0S_W0JDLZw-1
Received: by mail-ed1-f72.google.com with SMTP id z16-20020a05640235d000b0045485e4a5e0so13127026edc.1
        for <ksummit@lists.linux.dev>; Wed, 05 Oct 2022 02:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=20ff7s16mtIwZ8gqYFObUPuSeBfntjdVTNqXHSuaHoI=;
        b=v29ElX2qsdA1lAxvOVcIAtJjSuVC1D1mIT0JdwX3jyFpSY+9ax8sRCpayWGyPDI5uW
         HsDX1Kt5A/vdAEgqiBMpurdsXvYzA1rchShOOJBmCyF6UKFrWhIjFKUcZDReVqGYMYVX
         BqrSSoGiv4VAQwwGpnYOMqSnPwW09bbwBGYzdJvwsCiBopKLC4/6XeQ1tb80c52cfPCU
         cz78bucvynuVyWLyQXox9r8IQE+ESAZmnEGn4fj1AjN/JAG5ZOnlW6YElvyfFxtpWp7C
         BoxZVFFG53k9swpoJJHw230TQuK0/ocmjXJNSmFssrROzSBfwgPT2JmTZTIuldUNnqGM
         Zs9A==
X-Gm-Message-State: ACrzQf0D4I3ty9yJUx4omgtzIA9pXuCCdrdZTEylLHsTvfzYeQysSy3i
	NgKTQ6wicDLe+8nuZ5+chnhikg1S5FMF+beq082/ZyNFvMqYGbKjhoz8No1WJIA+9z086twCNFf
	aZwlP73dlVAIvXEneXA==
X-Received: by 2002:a17:907:8a04:b0:782:5277:2bac with SMTP id sc4-20020a1709078a0400b0078252772bacmr23287305ejc.128.1664963840703;
        Wed, 05 Oct 2022 02:57:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5mca9biPXLa+2VXu6jXHj36N0ePmCtaDc/BXk6keLmkoscY89Q4ZDPxtCjzrCOOdednWj6xg==
X-Received: by 2002:a17:907:8a04:b0:782:5277:2bac with SMTP id sc4-20020a1709078a0400b0078252772bacmr23287285ejc.128.1664963840468;
        Wed, 05 Oct 2022 02:57:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id oq4-20020a170906cc8400b0078b1ff41f05sm5053016ejb.43.2022.10.05.02.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 02:57:19 -0700 (PDT)
Message-ID: <477635db-c89b-cfd3-cd26-fea51bb094a5@redhat.com>
Date: Wed, 5 Oct 2022 11:57:19 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, ksummit <ksummit@lists.linux.dev>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <c74d9d75-4428-e22d-1adb-334b1173d871@leemhuis.info>
 <20221004202540.etokkm3jk6sk7z7y@meerkat.local>
 <89926f21-e172-9f3d-d08f-8d5eef812ee1@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <89926f21-e172-9f3d-d08f-8d5eef812ee1@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/5/22 11:00, Thorsten Leemhuis wrote:
> On 04.10.22 22:25, Konstantin Ryabitsev wrote:
>> On Tue, Oct 04, 2022 at 10:06:28PM +0200, Thorsten Leemhuis wrote:
>>> Your plan would afaics mean that we invest further into a software
>>> abandoned by its upstream and already becoming more and more of a
>>> maintenance burden. That investment would also further increase our
>>> dependency on that software by establishing workflows that rely on it.
>>> Is that really wise at this point? Wouldn't it be better to spend that
>>> time and effort to build something better that is more future proof?
>>
>> Unfortunately, there's no such thing. ;) And maybe we'll even help tip the
>> course of history into the other direction -- Red Hat uses bugzilla, and so
>> does OpenSuse, so there's a pretty good core of well-funded companies that
>> would be in a position to help keep bugzilla going if it's looking like the
>> platform is still alive. Or that could all be wishful thinking and they'll all
>> migrate to Jira or something equally horrible, who knows.
> 
> Well, Red Hat apparently is already in the process of migrating to Jira
> in the long run:
> https://lists.fedoraproject.org/archives/list/epel-devel@lists.fedoraproject.org/thread/U7TZRWXVUGBCHS6EBJIBSFAVPFUHHV7J/
> 
> To quote that mail from March:
> 
> ```
> As some of you may know, Red Hat has been using both Bugzilla and Jira
> via issues.redhat.com for RHEL development for several years.  Our
> intention is to move to using issues.redhat.com only for the major
> RHEL releases after RHEL 9.
> ```

That is for RHEL only though I'm not sure what the plans for Fedora are.

Also I do believe that the Red Hat bugzilla team is working on porting
bugzilla to postgresql, which would at least fix the problem of depending on
a no longer maintained mysql version.

If the postgresql port is something of interest to keep bugzilla.kernel.org
going for now, then it is probably best to just directly contact the bugzilla
maintainers @redhat.

Regards,

Hans




