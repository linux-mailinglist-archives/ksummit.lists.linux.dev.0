Return-Path: <ksummit+bounces-1119-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DA79A00D
	for <lists@lfdr.de>; Sun, 10 Sep 2023 23:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 511681C204FA
	for <lists@lfdr.de>; Sun, 10 Sep 2023 21:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921DD8BEC;
	Sun, 10 Sep 2023 21:16:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9708A49
	for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 21:15:58 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7927f24140eso136432539f.2
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 14:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694380558; x=1694985358; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2Q/e9FABMnbJiVlA+l81WIj96q3GIBpGDriFNDSINE=;
        b=a23JKir7lEHr2fY4PW8JkWpkUQJEytzXsGB7tAEFmag2o8AdHc2u4BnHZ69rf+dc5x
         Lwr+5LMFx3FZmeGOEpS2Abb6sIBceFyNvBlzlF2BHOqyvZxK93j8EpQG3Y+lDGf1r6wP
         8FFvPNF91qlkByVWW/57UOg8BeyAL93YQWq2VlbF7w1T+PdOzFbYFmEE5z971OQnu1hs
         h8ARw2OLrm7t1BWlzB3pUKE0yCX4iVdLGFRlIoliMSNwFfYjnnWF8TZW7vDVvTYNqMdp
         PZjVZfF3xWfbs999F7n61ogl88Um+nY0MVMXxGz1JjviUvzq48N7Ddm8QFws3P0Bk0pA
         Lc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694380558; x=1694985358;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2Q/e9FABMnbJiVlA+l81WIj96q3GIBpGDriFNDSINE=;
        b=Tk/+mvO1b7G/8IZpyh5U6q7FxkpZjHK06sMyUKiy87DAC05Z2MMJR+uixSQVbrawOW
         aA75Swd3Y6EmmPAtJ9qgVCyb602GoiSbuU3ZY7qsfIvnS98CZ6fx9Rf4olulSjWnH/Na
         OMOuPNQ+b6gQSFkmSPzEa4+EoREK8lSAn8PixfvdqZEU0ZF/AsLd1j9r3XELZxk0QYkU
         GmA0hV50MWSb82lhAVaee7xvqTJmIgILOTMQQdwmKg/V3jtdfvCWEWwykuTyZ6u3BzCR
         pHJQIKIpI9EuoUi50mvKybxhoWorMxCw5Zn4a/jC8kS31zrXuXA0nsyJ88SAu94BK/3K
         +8eg==
X-Gm-Message-State: AOJu0YxjJqXouXQG/Y0y/RUDybyC6NwzvCtvIJr1woaNpX7s1Ism7XUI
	Mp/VyrtSo5Cpl5gVGBDFv40=
X-Google-Smtp-Source: AGHT+IFtKQJRJu52kvtK9rfE/b719WGZQk49SrRB/+aJebwSdzUOAU+xIeNZ0r5sx5aWue8JxLaDag==
X-Received: by 2002:a05:6e02:2198:b0:34f:1e9c:45d5 with SMTP id j24-20020a056e02219800b0034f1e9c45d5mr10700253ila.32.1694380557679;
        Sun, 10 Sep 2023 14:15:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18-20020a056e02015200b0034989674ad7sm1898093ilr.52.2023.09.10.14.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 14:15:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b1765a8-3c3a-d4eb-0561-11c67570c92b@roeck-us.net>
Date: Sun, 10 Sep 2023 14:15:55 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: Dave Chinner <david@fromorbit.com>, Christoph Hellwig
 <hch@infradead.org>, ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <ZPyS4J55gV8DBn8x@casper.infradead.org>
 <a21038464ad0afd5dfb88355e1c244152db9b8da.camel@HansenPartnership.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
In-Reply-To: <a21038464ad0afd5dfb88355e1c244152db9b8da.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/23 12:51, James Bottomley wrote:
[ ... ]
>> I think that's a red herring.  Of course there are advances in
>> virtual hardware for those who need the best performance.  But
>> there's also qemu's ability to provide to you a 1981-vintage PC (or
>> more likely a 2000-era PC).  That's not going away.
> 
> So Red Hat dropping support for the pc type (alias i440fx)
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1946898
> 
> And the QEMU deprecation schedule
> 
> https://www.qemu.org/docs/master/about/deprecated.html
> 
> showing it as deprecated after 7.0 are wrong?  That's not to say
> virtualization can't help at all; it can certainly lengthen the time
> horizon, it's just not a panacea.

deprecated.html says:

pc-i440fx-1.4 up to pc-i440fx-1.7 (since 7.0)
           ^^^                 ^^^
These old machine types are quite neglected nowadays and thus might have
various pitfalls with regards to live migration. Use a newer machine type
instead.

Unless the qemu documentation is severely misleading, that does not
include pc-i440fx-{2-8}.{0-12}, and there is no indication that the
machine type "pc" (current alias of pc-i440fx-8.1) has been deprecated.

Guenter


