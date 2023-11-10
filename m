Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E67E7B21
	for <lists@lfdr.de>; Fri, 10 Nov 2023 11:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C09C3B20DDF
	for <lists@lfdr.de>; Fri, 10 Nov 2023 10:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C1A13ACA;
	Fri, 10 Nov 2023 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ma7VpWLf"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D821113FF1
	for <ksummit@lists.linux.dev>; Fri, 10 Nov 2023 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699610493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RCvmLt+4WEeOxVqR7Am6P7G2ixDgHghwf0pIww1AjAs=;
	b=Ma7VpWLfaokFlLHPpT1JQKR9QvjQLesWJh710poRgUdu53tZBsm8ciRwDZ5MGNAEm0Yw6Y
	yvc6cVp+9cSsDNEuQ7uSdwBKhCRpLdlbTvoSeWkC/W8j+x2/JRzv0q13sYX1t6+VXTJAUg
	/JgiUAXpBSsjPul6n5nH3N9grl9peao=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-o31IW-rwOIi0YjkX0uRDUQ-1; Fri, 10 Nov 2023 05:01:31 -0500
X-MC-Unique: o31IW-rwOIi0YjkX0uRDUQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9d4b8735f48so162241966b.1
        for <ksummit@lists.linux.dev>; Fri, 10 Nov 2023 02:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699610490; x=1700215290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCvmLt+4WEeOxVqR7Am6P7G2ixDgHghwf0pIww1AjAs=;
        b=V1iRHhgb8uQ7ZLwLb9PHD0ER9cm8Z7Ka1/vV2xZSF/OV1nCy8w5FXfK06ukR8NksdA
         xjG4Dl/eH6h23QM/VnqrmJ1a8mDY2ZfAYlWE8DwFRtjvh1GRA/YWib1Vud1n4+fWokvX
         +viYgEN84J6Z39Ya9qbscuiH2ARc2emGqHznCSlkLgdbxMmXLU1wvf8S/vBhEG9WqGbA
         hspWcIa8h3Jylc1aAnaXRRGrT8fZpUsoVsTCdYtCK29ygvD140pyrRp7TpaO9dAqMeQr
         8AJKQtYhiQBv5uIbLPu8g0orQ6eBJfKOpZQgWyRYuQ6MM+3N2VljS7BGt85k13ocm0vP
         NRLQ==
X-Gm-Message-State: AOJu0Yyrjsv5VKlA95pLQP3W9bNojOUfThEP8OPk78S/+R51Dkoi1oT+
	E+NWTrMUPD2W5qH02JFHkqdUDkheGaTmZge+Jqy348WD0B35uddSNpS0aNkz2fBCD4NBcc0LzV5
	p4Pq116/IYHpkRHH5fA==
X-Received: by 2002:a17:907:da1:b0:9be:e278:4d45 with SMTP id go33-20020a1709070da100b009bee2784d45mr6468969ejc.15.1699610490428;
        Fri, 10 Nov 2023 02:01:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwPJt6Rlq+A7o4SbTUIacQJCZer/hSnf3LGZSegnErXwG/8Ivh2IEuUTGhS7cxCPcv6u5d0w==
X-Received: by 2002:a17:907:da1:b0:9be:e278:4d45 with SMTP id go33-20020a1709070da100b009bee2784d45mr6468952ejc.15.1699610490042;
        Fri, 10 Nov 2023 02:01:30 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f4-20020a170906c08400b0098ce63e36e9sm3769473ejz.16.2023.11.10.02.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 02:01:29 -0800 (PST)
Message-ID: <52719262-4c01-4469-bc2b-51931062ab33@redhat.com>
Date: Fri, 10 Nov 2023 11:01:28 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, Pratyush Yadav
 <pratyush@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, users@linux.kernel.org, ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
 <20231107101513.GB27932@pendragon.ideasonboard.com>
 <mafs0o7g5hiba.fsf_-_@kernel.org>
 <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>
 <20231107-skilled-calculating-frigatebird-8db1bb@nitro>
 <cefe4c99-2af9-4e22-a448-801a7080fc48@redhat.com>
 <20231107-resolute-honest-pelican-8fe2a9@nitro>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
In-Reply-To: <20231107-resolute-honest-pelican-8fe2a9@nitro>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 17:51, Konstantin Ryabitsev wrote:
>> What about_pulling_  all patches from public-inbox?  Right now the git repos
>> underhttps://lore.kernel.org/lkml/  do not catch everything, but it's close
>> enough.  There would be nohttps://lore.kernel.org/all/1.git/  and, even if
>> there were, there is no easy way to filter out non-Linux projects.
>
> Sorry, I'm not entirely sure what you're asking. You want to be able to
> automatically retrieve all patches but only if they are related to the kernel?

Just all patches, but bonus points if I can filter out those not 
delivered to any kernel mailing list (QEMU is the largest that is 
archived by lore).  I could do the filtering on my own backend, but I 
guess I'm not the only who'd use it.

I agree with Jason Gunthorpe, by far the best solution here would be a 
processor on the backend that subscribes to all kernel-related mailing 
list and imports the patches (and only the patches) to a public-inbox 
git archive.  This would make patches@lists.linux.dev just work, and 
would be awesome.

Paolo


