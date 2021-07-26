Return-Path: <ksummit+bounces-459-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A43D5626
	for <lists@lfdr.de>; Mon, 26 Jul 2021 11:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E17AC3E0E4B
	for <lists@lfdr.de>; Mon, 26 Jul 2021 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3BA2FB2;
	Mon, 26 Jul 2021 09:08:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8898872
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 09:08:09 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D616D1FE5D;
	Mon, 26 Jul 2021 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627290481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NC20/Hu+C1aMjJ1/IuwPrjUdpmwlHRNS/fTAEfTgmJo=;
	b=z5aqAT7ROGkHHK0ED/cWtlVc3r2F4NMC160nE3QbjzU7Sl/bflkRGR+nqhEPo5FycL4EXm
	hRppv0771L4IiLh7jvsmWmcHo6qUO4CkycOhSZ0lYRW9WSulMFIbf+E7xJwadvXZixrT0j
	uSy6HryxduwrdV0fLCTxtUQfxq/at6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627290481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NC20/Hu+C1aMjJ1/IuwPrjUdpmwlHRNS/fTAEfTgmJo=;
	b=YzmZ2QZniMt7v/nfG7DpNWrUMMt/7bz/Gy0iFwExdDyOmZsBlaImiyQwQrGbx5geCdl0w8
	8Cu/Gd1aWZusJXCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A41A21365C;
	Mon, 26 Jul 2021 09:08:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id 3luvJnF7/mC/KgAAGKfGzw
	(envelope-from <hare@suse.de>); Mon, 26 Jul 2021 09:08:01 +0000
Subject: Re: Potential static analysis ideas
To: Julia Lawall <julia.lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, NeilBrown <neilb@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
References: <20210723191023.GG25548@kadam>
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
Date: Mon, 26 Jul 2021 11:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/26/21 10:55 AM, Julia Lawall wrote:
> 
> 
> On Mon, 26 Jul 2021, Arnd Bergmann wrote:
> 
>> On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>> On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
>>>>> On Sun, 25 Jul 2021, Laurent Pinchart wrote:
>>>>>>> To make it work well, you need to know if frob() and/or the current
>>>>>>> function return an error code or not.  While you can use some heuristics
>>>>>>> (e.g. is there any return -Exxx), perhaps we can add an annotation to
>>>>>>> indicate if a function returns an error code, or an error pointer?
>>>>>>
>>>>>> https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
>>>>>>
>>>>>> I think it would be useful, if not for the tools, at least for
>>>>>> developers.
>>>>>
>>>>> Agreed.  I added some code to smatch so that I could annotate pointers to
>>>>> say if they are allowed to be NULL.  The implementation isn't perfect,
>>>>> but I love having that extra documentation about when I do or don't have
>>>>> to check for NULL.
>>>>
>>>> I can think of four different annotations that limit what a pointer return from
>>>> a function can be:
>>>>
>>>> a) either a valid pointer or NULL, but never an error pointer,
>>>> b) either a valid pointer or an error pointer, but not NULL,
>>>> c) always a valid pointer, never NULL or an error,
>>>> d) always NULL, but callers are expected to check for error pointers.
>>>
>>> e) either a valid pointer, NULL, or an error pointer
>>>
>>> The last pattern is seen with the various *get*_optional() functions.
>>
>> I would always consider those the exact bug that I meant with "because
>> everyone gets those wrong". I think the idea of the "optional" functions is
>> that you have two implementations b) and d) and pick one of them
>> at compile time. To the caller this means either an error pointer or
>> success, but checking for NULL is a bug in the caller, while conditionally
>> returning NULL or ERR_PTR() would be a bug in the interface.
> 
> I'm not sure to understand the "bug in the caller" part.  Couldn't there
> be two possible definitions of the called function, according to different
> configuration options, and a single caller that calls both?
> 
> Also, over 230 files contain functions that return both NULL and ERR_PTR.
> A random example, chosen for conciseness, is the following from
> fs/overlayfs/inode.c:
> 
> struct inode *ovl_lookup_inode(struct super_block *sb, struct dentry *real,
>                                 bool is_upper)
> {
>   	struct inode *inode, *key = d_inode(real);
> 
>          inode = ilookup5(sb, (unsigned long) key, ovl_inode_test, key);
> 	if (!inode)
>                  return NULL;
> 
>          if (!ovl_verify_inode(inode, is_upper ? NULL : real,
>                                is_upper ? real : NULL, false)) {
>                  iput(inode);
>                  return ERR_PTR(-ESTALE);
>          }
> 
>          return inode;
> }
> 
And that I would consider a coding error.
If a function is able to return an error pointer it should _always_ 
return an error pointer; here it would be trivial to return -ENXIO 
instead of NULL in the first condition.

Not doing so is just sloppy programming IMO.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

